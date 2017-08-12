#! /bin/sh

set -e

case $(arch) in
	x86_64)
		TRIPLET=x86_64-linux-gnu
		;;
	armv7l)
		TRIPLET=arm-linux-gnueabihf
		;;
esac

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export LANGUAGE=C.UTF-8

PERLCMD="$SNAP/usr/bin/perl5.22-$TRIPLET -I \
	$SNAP/usr/lib/$TRIPLET/perl5/5.22 -I \
	$SNAP/usr/share/perl5 -I \
	$SNAP/usr/share/perl5/5.22 -I \
        $SNAP/usr/share/perl/5.22.1 -I \
        $SNAP/usr/lib/$TRIPLET/perl/5.22.1"

$PERLCMD $SNAP/get_iplayer --ffmpeg=$SNAP/usr/bin/ffmpeg "$@"
