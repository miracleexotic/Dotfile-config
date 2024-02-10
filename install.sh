echo "============\n"
echo "Installation\n"
echo "============\n\n"

echo "[+] Ansible"
echo "\n[i] Install Ansible"
sudo pacman -S ansible
echo "\n[i] Check Ansible version"
ansible --version

echo "\n\n[+] Dotfile-config"
echo "\n[i] Download Dotfile-config"
git clone -b Arch --single-branch https://github.com/miracleexotic/Dotfile-config.git
echo "\n[i] Install via ansible-playbook"
cd Dotfile-config/
sudo ansible-playbook install.yaml

