# Disk partitioning
SWAP = 12GB
EFI = 512MB
FILESYSTEM = 100% - SWAP - EFI


# Mount points
SWAP = NIL
EFI = /mnt/boot
FILESYSTEM = /mnt

# Disk layout
|--------------------------------------------------|
| Mount point | Partition   | Partiton type | Size | 
| ----------- | ----------- | ------------- | ---- |
| /mnt/boot   | /dev/$EFI   | EFI Partition | 512M |       
| [SWAP]      | /dev/$SWAP  | Linux Swap    | 10GB | 
| ----------- | ----------- | ------------- | ---- |
| /mnt        | /dev/$ROOT  | LinuxFS x86-64| All  |
|--------------------------------------------------|

# Pacstrap packages
REQUIRED = [ base, linux, linux-firmware, networkmanager, grub, efibootmgr,sudo, git ]

OPTIONAL = [ vim, zip, unzip, xorg, xorg-server, xorg-xini ]
