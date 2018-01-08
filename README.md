image-proxy
===========

Ruby dynamic image conversion proxy

Forked from https://github.com/eahanson/imageproxy

This version adds caching. In order for the cache to work you need a folder where your
web server (nginx / apache etc) can serve static files.

Set the location for your cache files with environment variable `IMAGE_CACHE_DIR`

