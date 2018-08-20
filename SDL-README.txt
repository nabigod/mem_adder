Ubuntu14.04.5 추가 패키지 설치
===

- [ ] 일반패키지
user@linux:~$ sudo apt-get install texinfo libsdl-mixer1.2 libsdl-image1.2 m4 libtool flex bison binutils autoconf automake autotools-dev


- [ ]  SDL패키지
https://askubuntu.com/questions/786300/how-to-install-all-sdl-libraries-in-ubuntu-14-04

설치가능패키지 검사
user@linux:~$ apt-cache search ^libsdl | grep 1.2

소스코드 빌드및 사용
user@linux:~$ wget https://www.libsdl.org/release/SDL-1.2.15.tar.gz

user@linux:~$ wget http://archive.ubuntu.com/ubuntu/pool/universe/s/sdl-image1.2/sdl-image1.2_1.2.12.orig.tar.gz

user@linux:~$ wget http://archive.ubuntu.com/ubuntu/pool/universe/s/sdl-mixer1.2/sdl-mixer1.2_1.2.12.orig.tar.gz

user@linux:~$ wget http://archive.ubuntu.com/ubuntu/pool/universe/s/sdl-ttf2.0/sdl-ttf2.0_2.0.11.orig.tar.gz
user@linux:~$ sudo apt-get install libsdl-ttf2.0-0 <? 이것도 필요하다( https://stackoverflow.com/questions/31716754/pygame-importerror-libsdl-ttf-2-0-so-0-cannot-open-shared-object-file-no-suc )

압축 해제후 각 디렉토리에서 ./configure; make; sudo make install

- [ ]  SDL 크로스컴파일 방법
user@linux:~$ sudo make CROSS_COMPILE=/opt/arm-2010q1/bin/arm-none-linux-gnueabi- ROOTFS ROOTFS=$ROOTFS

- [ ]  SDL튜토리얼
http://lazyfoo.net/SDL_tutorials/
