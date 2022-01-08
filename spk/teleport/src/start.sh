#!/bin/sh

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

dir=`dirname $0`
sed -i 's/package/root/' "/var/packages/teleport/conf/privilege"

synopkg start teleport > /dev/null
