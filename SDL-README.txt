Ubuntu14.04.5 �߰� ��Ű�� ��ġ
===

- [ ] �Ϲ���Ű��
user@linux:~$ sudo apt-get install texinfo libsdl-mixer1.2 libsdl-image1.2 m4 libtool flex bison binutils autoconf automake autotools-dev


- [ ]  SDL��Ű��
https://askubuntu.com/questions/786300/how-to-install-all-sdl-libraries-in-ubuntu-14-04

��ġ������Ű�� �˻�
user@linux:~$ apt-cache search ^libsdl | grep 1.2

�ҽ��ڵ� ����� ���
user@linux:~$ wget https://www.libsdl.org/release/SDL-1.2.15.tar.gz

user@linux:~$ wget http://archive.ubuntu.com/ubuntu/pool/universe/s/sdl-image1.2/sdl-image1.2_1.2.12.orig.tar.gz

user@linux:~$ wget http://archive.ubuntu.com/ubuntu/pool/universe/s/sdl-mixer1.2/sdl-mixer1.2_1.2.12.orig.tar.gz

user@linux:~$ wget http://archive.ubuntu.com/ubuntu/pool/universe/s/sdl-ttf2.0/sdl-ttf2.0_2.0.11.orig.tar.gz
user@linux:~$ sudo apt-get install libsdl-ttf2.0-0 <? �̰͵� �ʿ��ϴ�( https://stackoverflow.com/questions/31716754/pygame-importerror-libsdl-ttf-2-0-so-0-cannot-open-shared-object-file-no-suc )

���� ������ �� ���丮���� ./configure; make; sudo make install

- [ ]  SDL ũ�ν������� ���
user@linux:~$ sudo make CROSS_COMPILE=/opt/arm-2010q1/bin/arm-none-linux-gnueabi- ROOTFS ROOTFS=$ROOTFS

- [ ]  SDLƩ�丮��
http://lazyfoo.net/SDL_tutorials/
