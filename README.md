# system-setup-tools

## Setup [Secure RSA](https://github.com/justsml/system-setup-tools/blob/master/modules/ssh-key-generator.sh#L45) & [ED25519 Keys](https://github.com/justsml/system-setup-tools/blob/master/modules/ssh-key-generator.sh#L37)

```sh
curl -L https://raw.githubusercontent.com/justsml/system-setup-tools/master/modules/ssh-key-generator.sh | bash
```

## Setup Docker Host Server
Tested on Ubuntu 16.04+, Debian 7, 8, 9.

1. Add SSH Keys - You should configure this for your keys ;) 
1. Sets up common dependencies (nfs, zfs, aufs, curl, openssl, vim)
1. If not already installed, install Docker
1. If needed, it creates new id_rsa & id_ed25519 keys
1. Sets up Bash env w/ pimped out [.bashrc](https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bashrc) and [.bash_aliases](https://raw.githubusercontent.com/justsml/system-setup-tools/master/home-scripts/.bash_aliases)
1. Sets better defaults for `net.core.rmem_max` `net.ipv4.tcp_max_syn_backlog` `net.core.somaxconn` `net.ipv4.ip_local_port_range`.
1. Tuned for mongodb, redis, et al. with disabled transparent-hugepages
1. Adds `cgroup` support to GRUB

```sh
curl -L https://github.com/justsml/system-setup-tools/raw/master/server-setup-2016.sh | bash
```
