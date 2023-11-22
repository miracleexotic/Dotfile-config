## Install Ansible in Control-Node
Add Repository
**Note:** _include the official project’s PPA (personal package archive) in your system’s list of sources_
```sh
$ sudo GNUTLS_CPUID_OVERRIDE=0x1 apt-add-repository ppa:ansible/ansible
```

Refresh your system’s package index with newly PPA
```sh
$ sudo GNUTLS_CPUID_OVERRIDE=0x1 apt update
```

Install Ansible Software
```sh
$ sudo GNUTLS_CPUID_OVERRIDE=0x1 apt install ansible
```

Check version
```sh
$ ansible --version
```

## Run playbook
```sh
$ export GNUTLS_CPUID_OVERRIDE=0x1
$ git clone -b Ubuntu22.04 --single-branch https://github.com/miracleexotic/Dotfile-config.git
$ cd Dotfile-config/
$ ansible-playbook install.yaml
```
