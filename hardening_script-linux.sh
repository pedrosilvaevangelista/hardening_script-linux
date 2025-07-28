#!/bin/bash
# Hardening básico para sistemas Linux baseados em Debian
# Desenvolvido por Pedro Evangelista | github: https://github.com/pedrosilvaevangelista

# Cores
VERDE="\033[1;32m"
AZUL="\033[1;34m"
AMARELO="\033[1;33m"
VERMELHO="\033[1;31m"
RESET="\033[0m"

echo -e "${VERDE}[+] Iniciando hardening básico...${RESET}"

# Atualiza os pacotes
echo -e "${AZUL}[+] Atualizando pacotes do sistema...${RESET}"
apt update && apt upgrade -y

# Criação de usuário admin
echo -e "${AZUL}[+] Criando usuário 'admin' com permissões de sudo...${RESET}"
useradd -m -s /bin/bash admin
echo "admin:lab123" | chpasswd
usermod -aG sudo admin

# Backup do sshd_config
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Configurações de segurança no SSH
echo -e "${AZUL}[+] Configurando SSH para maior segurança...${RESET}"
sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/^#*Protocol.*/Protocol 2/' /etc/ssh/sshd_config
sed -i 's/^#*PermitEmptyPasswords.*/PermitEmptyPasswords no/' /etc/ssh/sshd_config
sed -i 's/^#*X11Forwarding.*/X11Forwarding no/' /etc/ssh/sshd_config
sed -i 's/^#*AllowTcpForwarding.*/AllowTcpForwarding no/' /etc/ssh/sshd_config
systemctl restart ssh

# Instala Fail2Ban
echo -e "${AZUL}[+] Instalando e ativando Fail2Ban...${RESET}"
apt install -y fail2ban
systemctl enable --now fail2ban

# Permissões críticas
echo -e "${AZUL}[+] Ajustando permissões de arquivos sensíveis...${RESET}"
chmod 644 /etc/passwd
chmod 640 /etc/shadow

# Ativa atualizações automáticas
echo -e "${AZUL}[+] Ativando atualizações automáticas de segurança...${RESET}"
apt install -y unattended-upgrades
dpkg-reconfigure -f noninteractive unattended-upgrades

# Força senhas fortes via PAM
echo -e "${AZUL}[+] Configurando política de senhas fortes...${RESET}"
apt install -y libpam-pwquality
sed -i 's/^#*password.*requisite.*pam_pwquality.so.*/password requisite pam_pwquality.so retry=3 minlen=12 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1/' /etc/pam.d/common-password

# Kernel hardening via sysctl
echo -e "${AZUL}[+] Aplicando hardening no kernel...${RESET}"
cat <<EOF >/etc/sysctl.d/99-hardening.conf
net.ipv4.ip_forward=0
net.ipv4.conf.all.send_redirects=0
net.ipv4.conf.default.send_redirects=0
net.ipv4.conf.all.accept_redirects=0
net.ipv4.conf.default.accept_redirects=0
net.ipv4.conf.all.accept_source_route=0
net.ipv4.conf.default.accept_source_route=0
net.ipv4.conf.all.log_martians=1
net.ipv4.conf.default.log_martians=1
net.ipv4.icmp_echo_ignore_broadcasts=1
net.ipv4.icmp_ignore_bogus_error_responses=1
net.ipv4.tcp_syncookies=1
kernel.kptr_restrict=2
net.ipv4.conf.all.rp_filter=1
EOF

sysctl --system

# Banner SSH
echo -e "${AZUL}[+] Adicionando banner de login SSH...${RESET}"
SSH_BANNER="/etc/issue.net"
echo "Acesso autorizado apenas. Toda atividade será monitorada e registrada." > "$SSH_BANNER"
if ! grep -q "^Banner $SSH_BANNER" /etc/ssh/sshd_config; then
  echo "Banner $SSH_BANNER" >> /etc/ssh/sshd_config
fi

# Reinicia SSH para aplicar banner
systemctl restart ssh

# Firewall (Opcional: Remova comentário para ativar)
# echo -e "${AZUL}[+] Ativando firewall (ufw)...${RESET}"
# apt install -y ufw
# ufw default deny incoming
# ufw default allow outgoing
# ufw allow ssh
# ufw enable

# Desativar IPv6 (Opcional)
# echo -e "${AZUL}[+] Desativando IPv6 (opcional)...${RESET}"
# cat <<EOF >> /etc/sysctl.conf
# net.ipv6.conf.all.disable_ipv6 = 1
# net.ipv6.conf.default.disable_ipv6 = 1
# EOF
# sysctl -p

echo -e "${VERDE}[+] Hardening concluído com sucesso!${RESET}"
echo -e "${AMARELO}[!] Reinicie o sistema para aplicar todas as alterações.${RESET}"

