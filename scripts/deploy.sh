#!/bin/bash

git checkout gh-pages

rm -rf public
hugo -d public
cd public
git add --all
git commit -m "Publishing to gh-pages"
git push origin gh-pages
cd ..
# git push origin gh-pages
