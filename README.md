# Prebuild-openssl-shell
openssl shell, include android and ios

If you want to build by yourself
Android
1. use ndk r10e
2. have wget command. if not have, modify init-android-openssl.sh like this:
	a. open init-android-openssl, download openssl by yourself
	b. modify OPENSSL_DIR and OPENSSL_PACKAGE to your openssl package
	c. comment out wget line.
	d. tar your openssl package
3. modify do-compile-openssl.sh ANDROID_NDK to your ndk path
4. run init-android-openssl.sh
5. run compile-openssl.sh
6. lib in build dir

ios
1. have wget command. if not have, modify init-ios-openssl.sh like this:
	a. open init-ios-openssl, download openssl by yourself
	b. modify OPENSSL_DIR and OPENSSL_PACKAGE to your openssl package
	c. comment out wget line.
	d. tar your openssl package
2. run init-ios-openssl.sh
3. run compile-openssl.sh
4. lib in build dir


Good luck, enjoy it!!!!

