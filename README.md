# break-zlib

Sample code of breaking libz.so.1 by libmysqlclient.so.18.

```
$ make run
make \
                perl-image-magick-ng \
                perl-image-magick-ok \
                perl-zlib-ng \
                perl-zlib-ok
docker-compose run --rm app perl -MDBD::mysql -MImage::Magick -E 'say Image::Magick->new()->Read("/test.png") || "OK"'
Exception 425: corrupt image `/test.png' @ error/png.c/ReadPNGImage/3789
docker-compose run --rm app perl -MImage::Magick -MDBD::mysql -E 'say Image::Magick->new()->Read("/test.png") || "OK"'
OK
docker-compose run --rm app perl -MDBD::mysql -MCompress::Raw::Zlib -E 'say new Compress::Raw::Zlib::Inflate'
stream error
docker-compose run --rm app perl -MCompress::Raw::Zlib -MDBD::mysql -E 'say new Compress::Raw::Zlib::Inflate'
Compress::Raw::Zlib::inflateStream=SCALAR(0xcf3698)

$ docker-compose run --rm app make run
make \
        run-with-mysql \
        run-without-mysql \
        run-without-mysql-load-zlib \
        run-without-mysql-load-libmysqlclient
make[1]: Entering directory `/src'
gcc -I/usr/include/mysql -m64 -L/usr/lib64/mysql --shared /usr/lib64/mysql/libmysqlclient.so.18 mysql.c -o mysql.so
gcc -lz --shared -fPIC zlib.c -o zlib.so
gcc -rdynamic -ldl main.c -o main
./main ./mysql.so
init:-2
./main
init:0
LD_PRELOAD="/usr/lib64/libz.so.1" ./main ./mysql.so
init:0
LD_PRELOAD="/usr/lib64/mysql/libmysqlclient.so.18" ./main ./mysql.so
init:0
make[1]: Leaving directory `/src'
```
