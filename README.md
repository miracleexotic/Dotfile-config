## Install Ansible in Control-Node

Install Ansible Software

```sh
$ sudo pacman -S ansible
```

Check version

```sh
$ ansible --version
```

## Configuration

Git clone Ubuntu22.04 branch

```sh
$ git clone -b Arch --single-branch https://github.com/miracleexotic/Dotfile-config.git
```

Run Ansible with sudo permission

```sh
$ cd Dotfile-config/
$ sudo ansible-playbook install.yaml
```
