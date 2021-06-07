#!/bin/sh
# This is free and unencumbered software released into the public domain.
#  For more information, please refer to <https://unlicense.org>

if [ "$(uname -s)" != "Linux" ] ; then
	echo "This only runs on Linux (requires the GNU C Library)"
	exit
else
	echo -e "\nInfo: this only works with the GNU C Library\n"
fi

#-------------------
app="src/unace"
app_args='x tests/zdir.ace'
app_cleanup='rm -rf zman'
#make_clean='make clean'
configure_opts='--prefix=/usr'
export CFLAGS="-D${appbn}_TRACE -ggdb3"
#-------------------

appbn=$(basename $app)
#if defined(appbn_TRACE) && defined(__GLIBC__)
#include <mcheck.h>
#endif

#int main(int argc, char * argv[])
#{
#if defined(appbn_TRACE) && defined(__GLIBC__)
#   mtrace();
#endif
#}

export MALLOC_TRACE=$(pwd)/mtrace.txt

if ! command -v mtrace >/dev/null 2>&1 ; then
	printf "mtrace is missing\n";
	exit
fi

if ! test -f configure ; then
	if test -f autogen.sh ; then
		./autogen.sh
	fi
fi

if test -f configure ; then
	if ! test -f config.h ; then
		./configure ${configure_opts}
	fi
fi

if test -f Makefile ; then
	${make_clean}
	make
fi

if ! test -f ${app} ; then
	echo "$app not found"
	exit 1
fi

${app} ${app_args}
${app_cleanup}

mtrace ${app} mtrace.txt > mtrace-out.txt;
if [ $? -eq 0 ] ; then
	printf "see mtrace-out.txt\n";
fi
