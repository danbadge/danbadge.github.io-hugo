#!/bin/bash
rm -rf public/*

git submodule init
git submodule sync
git submodule update --remote
