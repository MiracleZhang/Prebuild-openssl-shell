#! /usr/bin/env bash
#
# Create by Zhang Jianping <114695092@qq.com> at 20171017
#
# Enjoy it!!!!


OPENSSL_URL="http://www.openssl.org/source/"
OPENSSL_PACKAGE="openssl-1.0.2k.tar.gz"
OPENSSL_DIR="openssl-1.0.2k"

echo "== download openssl source code =="

wget $OPENSSL_URL/$OPENSSL_PACKAGE

if ! [[ -d $OPENSSL_DIR ]]; then
    rm -rf $OPENSSL_DIR
fi

tar -xzvf $OPENSSL_PACKAGE

set -e

if ! [[ -d "source" ]]; then
    mkdir "source"
fi

function cp_fork()
{
    echo "== openssl fork $1 =="

    if [[ -d "source/openssl-$1" ]]; then
        rm -rf "source/openssl-$1"
    fi

    cp -r $OPENSSL_DIR source/openssl-$1
	rm -f source/openssl-$1/Makefile
}

cp_fork "armv7"
cp_fork "armv7s"
cp_fork "arm64"
cp_fork "i386"
cp_fork "x86_64"

echo "== download openssl source code end =="
