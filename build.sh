#!/bin/bash

git config --global user.email "travis@travis-ci.org"
git config --global user.name "travis-ci"
git clone --quiet --branch=master https://${CI_USER_TOKEN}@github.com/elbenvenutti/elbenvenutti.github.io public > /dev/null

hugo

cd public
git commit -am "Travis build $TRAVIS_BUILD_NUMBER"
git push -fq origin master > /dev/null
