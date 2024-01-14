echo "============\n"
echo "Installation\n"
echo "============\n\n"

echo "[+] Ansible"
echo "\n[i] Add repository"
sudo GNUTLS_CPUID_OVERRIDE=0x1 apt-add-repository ppa:ansible/ansible

echo "\n[i] Update"
sudo GNUTLS_CPUID_OVERRIDE=0x1 apt update
echo "\n[i] Install Ansible"
sudo GNUTLS_CPUID_OVERRIDE=0x1 apt install ansible
echo "\n[i] Check Ansible version"
ansible --version

echo "\n\n[+] Dotfile-config"
echo "\n[i] Download Dotfile-config"
export GNUTLS_CPUID_OVERRIDE=0x1
git clone -b Ubuntu22.04 --single-branch https://github.com/miracleexotic/Dotfile-config.git
echo "\n[i] Install via ansible-playbook"
cd Dotfile-config/
sudo ansible-playbook install.yaml

