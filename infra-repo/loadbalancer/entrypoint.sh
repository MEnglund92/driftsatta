#!/bin/sh

# Aktivera IP-forwarding så att trafik kan skickas vidare genom containern
echo 1 > /proc/sys/net/ipv4/ip_forward

# Ladda nftables-konfigurationen från filen
nft -f /etc/nftables.conf

echo "Lastbalanserare startad."

# Håll containern igång (annars dör den direkt efter att reglerna laddats)
tail -f /dev/null