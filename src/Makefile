main: main.c mysql.so zlib.so
	gcc -ldl main.c -o main

mysql.so: mysql.c
	gcc -I/usr/include/mysql -m64 -L/usr/lib64/mysql --shared /usr/lib64/mysql/libmysqlclient.so.18 mysql.c -o mysql.so

zlib.so: zlib.c
	gcc -lz --shared -fPIC zlib.c -o zlib.so

clean:
	rm -f zlib.so mysql.so main

run:
	${MAKE} \
		run-with-mysql \
		run-without-mysql \
		run-without-mysql-load-zlib \
		run-without-mysql-load-libmysqlclient

run-with-mysql: main
	./main ./mysql.so

run-without-mysql: main
	./main

run-without-mysql-load-zlib: main
	LD_PRELOAD="/usr/lib64/libz.so.1" ./main ./mysql.so

run-without-mysql-load-libmysqlclient: main
	LD_PRELOAD="/usr/lib64/mysql/libmysqlclient.so.18" ./main ./mysql.so
