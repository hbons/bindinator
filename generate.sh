#!/bin/bash

make
sudo make install

rm -Rf WebKit*

bindinate --gir=WebKit2-4.0 -d=GLIB_SHARP,glib-sharp-3.0 -d=GTK_SHARP,gtk-sharp-3.0 \
    -d=GIO_SHARP,gio-sharp-3.0 -d=GDK_SHARP,gdk-sharp-3.0

cp webkitgtk-sharp.metadata WebKit2-4.0/sources/webkit2-sharp.metadata
cd WebKit*

git init
git add -A
git commit -m "Generated WebKit2-4.0 bindings"
git remote add origin git@github.com:hbons/webkit2-sharp.git
git push -f origin master

# ./autogen.sh --prefix=/usr --libdir=/usr/lib --enable-monodoc=no
# make
# sudo make install

