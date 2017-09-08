#!/bin/bash
# -*- coding: utf-8 -*-

sudo apt-get install -y golang
sudo apt-get install libgtk2.0-dev libglib2.0-dev libgtksourceview2.0-dev -y
mkdir $HOME/.go
go get github.com/mattn/go-gtk/gtk
go install github.com/mattn/go-gtk/gtk
go get github.com/nsf/gocode
