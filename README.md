# vagrant-ansible-conf
A PoC configuration scripts for automation and hardening VMs with Vagrant &amp; Ansible

## Environment
<!-- TODO -->

## Prerequisites
Scripts should be run from the root project directory.

### Powershell
Install required Vagrant plugins on Windows:
```
.\scripts\setup_vagrant.bat 
```
To properly configure permissions for private key files in the WSL environment, Windows partitions must be mounted with
additional parameters. To create required `wsl.conf` file run script:
```
.\scripts\setup_wsl.bat "Distribution Name"
```

### WSL shell
To change permissions for private keys in WSL enviroment:
```
./scripts/change_privkey_perms.sh
```