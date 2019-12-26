# private

A scratch space for me/contains personal files

- 00-macrandomise.conf is a NetworkManager config file that enables random MAC address creation per-AP. It should be placed in /etc/NetworkManager/conf.d/
- 80-clevis-udisks2.rules is a Polkit rule that enables admin users to use clevis-udisks2 without authentication, allowing automatic decryption and mounting of udisks2 hard drives. It should be placed in /etc/polkit-1/rules.d/
- 80-tpm2.rules is a udev rule that makes tpm2 devices world-readable and -writable. It should be placed in /etc/udev/rules.d/
- alternate-nouveau_nvidia.sh switches the graphics driver between nouveau and the NVIDIA binary driver. It should be executed directly
- filter.list is a list of ipset rules
- journald.conf is set to the Fedora defaults, but disables kernel logging. It should be placed in /etc/systemd/
- stubby.yml contains a configuration for the stubby DoT resolver. It should be placed in /etc/stubby/
- sysctl.conf contains a small set of tweaks designed to improve security. It should be placed in /etc/

### NetworkManager commands

`nmcli c modify <network UUID> <connection.type, e.g. 802-11-wireless>.cloned-mac-address random|stable|permanent`

```shell
nmcli c down <UUID of active network>
nmcli c up <UUID of active network>
```
