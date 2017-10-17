#! /usr/bin/env bash
#
# Create by Zhang Jianping <114695092@qq.com> at 20171017
#
# Enjoy it!!!!

#----------
UNI_BUILD_ROOT=`pwd`
FF_TARGET=$1
set -e
set +x

FF_ALL_ARCHS="armv5 armv7a x86 arm64 x86_64"

echo_archs() {
    echo "===================="
    echo "[*] check archs"
    echo "===================="
    echo "FF_ALL_ARCHS = $FF_ALL_ARCHS"
    echo ""
}

if ! [[ -d "build" ]]; then
	mkdir build
fi

#----------
if [ "$FF_TARGET" = "armv5" -o "$FF_TARGET" = "armv7a" -o "$FF_TARGET" = "arm64" ]; then
    echo_archs
    sh do-compile-openssl.sh $FF_TARGET
elif [ "$FF_TARGET" = "x86" -o "$FF_TARGET" = "x86_64" ]; then
    echo_archs
    sh do-compile-openssl.sh $FF_TARGET
elif [ "$FF_TARGET" = "all" ]; then
    echo_archs
    for ARCH in $FF_ALL_ARCHS
    do
        sh do-compile-openssl.sh $ARCH
    done
elif [ "$FF_TARGET" == "check" ]; then
    echo_archs
elif [ "$FF_TARGET" == "clean" ]; then
    echo_archs
	rm -rf ./source/openssl-*
    rm -rf ./build/openssl-*
else
    echo "Usage:"
    echo "  compile-openssl.sh armv5|armv7a|x86"
    echo "  compile-openssl.sh all"
    echo "  compile-openssl.sh clean"
    echo "  compile-openssl.sh check"
    exit 1
fi

#----------
echo "\n--------------------"
echo "[*] Finished"
echo "--------------------"
