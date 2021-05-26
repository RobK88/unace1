SYSTEMN = DOS
COMPNM  = WATCOM_C
CSYSTEM = DOS
COMP    = wcc386
CFLAGS  = -bt=$CSYSTEM -mf -5r -zt -zq -wx -we -ot -d$COMPNM -d$SYSTEMN

SYSTEM = dos4g
LINK   = wlink
LFLAGS = op stack=8192

OBJS=unace.obj uac_sys.obj uac_crc.obj uac_dcpr.obj uac_comm.obj uac_crt.obj globals.obj

.c.obj: .autodepend
	$COMP $CFLAGS $[*.c

unace.exe: $OBJS
	set file_cmd=file {$(OBJS)}
	$LINK $FLAGS system $SYSTEM @file_cmd name unace
	set file_cmd=
