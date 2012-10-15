#!/bin/bash

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   declare -r linux=true
else
   declare -r linux=false
fi

if [[ $linux ]]; then
	declare -r rep="apt-get"
else
	declare -r rep="brew"
fi

mkdir ~/webDependensies
cd 	~/webDependensies

$rep update

##install dependencies

$rep install git-core curl build-essential openssl libssl-dev

## check the existing off node
noNode=false
which node || noNode=true
if $noNode; then
	## install node js 
	echo "Installing Node ..."
	git clone https://github.com/joyent/node.git
	cd node
	git checkout v0.9.2
	./configure
	make
	make install
	cd ..
else 
	echo "Node js already installed"
fi

## check the existing off npm
noNpm=false
which npm || noNpm=true
if $noNpm; then
	## install npm js
	echo "Installing npm ..."
	curl https://npmjs.org/install.sh | sh
else 
	echo "npm already installed"
fi

## check the existing off grunt
noGrunt=false
npm ls | grep grunt || noGrunt=true
if $noGrunt; then
	## install grunt js
	echo "Installing grunt ..."
	npm install -g grunt
else 
	echo "Grunt already installed"
fi

## check the existing off Closure Compiler
noCc=false
npm ls | grep grunt-closure-compiler || noCc=true
if $noCc; then
	npm install grunt-closure-compiler
else
	echo "Closure compiler already installed"
fi

## check the existing off Coffee Lint
noCl=false
npm ls | grep grunt-coffeelint || noCl=true
if $noCl; then
	npm install grunt-coffeelint
else
	echo "Coffee lint already installed"
fi

## check the existing off Jasmine runner
noJr=false
npm ls | grep grunt-jasmine-runner || noJr=true
if $noJr; then
	npm install grunt-jasmine-runner
else
	echo "Jasmine Runner already installed"
fi

