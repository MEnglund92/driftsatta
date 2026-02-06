#!/bin/sh

# Ladda nftables-konfigurationen från filen
nft -f /etc/nftables.conf

echo "Lastbalanserare startad."

# Håll containern igång (annars dör den direkt efter att reglerna laddats)
tail -f /dev/null