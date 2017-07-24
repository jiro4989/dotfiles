#!/bin/bash
# -*- coding: utf-8 -*-

git add .
git commit
git push origin master

