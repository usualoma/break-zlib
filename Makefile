run:
	${MAKE} \
		perl-image-magick-ng \
		perl-image-magick-ok \
		perl-zlib-ng \
		perl-zlib-ok

perl-image-magick-ng:
	docker-compose run --rm app perl -MDBD::mysql -MImage::Magick -E 'say Image::Magick->new()->Read("/test.png") || "OK"'

perl-image-magick-ok:
	docker-compose run --rm app perl -MImage::Magick -MDBD::mysql -E 'say Image::Magick->new()->Read("/test.png") || "OK"'

perl-zlib-ng:
	docker-compose run --rm app perl -MDBD::mysql -MCompress::Raw::Zlib -E 'say new Compress::Raw::Zlib::Inflate'

perl-zlib-ok:
	docker-compose run --rm app perl -MCompress::Raw::Zlib -MDBD::mysql -E 'say new Compress::Raw::Zlib::Inflate'
