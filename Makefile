CC=gcc
OBJS=vfat
MNTDIR=testdir
all:${OBJS}
vfat:vfat.c
	${CC} -Wall -g -std=c99 -O0 -D_FILE_OFFSET_BITS=64 \
	vfat.c -o $@ -lfuse

mount:vfat
	ls ${MNTDIR}	
	./vfat -s -f usbfat32d.img ${MNTDIR}

umount:
	fusermount -u -z ${MNTDIR}

prepare:
	sudo apt-get install libfuse2 libfuse-dev -y
	
tar:clean
	${SHELL} tar.sh

clean:
	rm -f *.o ${OBJS}
