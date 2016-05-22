#*
# * install-gtk.sh
# * 
# * Copyright 2016 ATADMIN <ATADMIN@KRONOS>
# * 
# * This program is free software; you can redistribute it and/or modify
# * it under the terms of the GNU General Public License as published by
# * the Free Software Foundation; either version 2 of the License, or
# * (at your option) any later version.
# * 
# * This program is distributed in the hope that it will be useful,
# * but WITHOUT ANY WARRANTY; without even the implied warranty of
# * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# * GNU General Public License for more details.
# * 
# * You should have received a copy of the GNU General Public License
# * along with this program; if not, write to the Free Software
# * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# * MA 02110-1301, USA.
# * 
# * 

echo "Updating package tree..."
pacman -Sy pacman
pacman -Syu

echo "Updateing System"
pacman -Su

echo "Installing GTK"
pacman -S python3
pacman -S python2
pacman -S mingw32/mingw-w64-x86_64-gtksourceview3
pacman -S mingw64/mingw-w64-x86_64-clutter-gtk
pacman -S mingw64/mingw-w64-x86_64-gtk3
pacman -S gcc
pacman -S mingw-w64-x86_64-gobject-introspection
pacman -S mingw-w64-x86_64-gobject-introspection-runtime
pacman -S mingw64/mingw-w64-x86_64-python2-gobject 
pacman -S mingw64/mingw-w64-x86_64-python3-gobject
pacman -S mingw32/mingw-w64-x86_64-gtksourceview3
