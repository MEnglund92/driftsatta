#!/bin/sh

# Ladda nftables-reglerna
nft -f /etc/nftables.conf

echo "Lastbalanserare startad."
# Håll processen vid liv
tail -f /dev/null