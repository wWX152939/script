#!/bin/bash

function cpserver()
{
	cp $1/res/values/strings.xml castserver/res/values/strings.xml
	cp $1/res/values-en/strings.xml castserver/res/values-en/strings.xml
}

v7path=/media/onekey/bcc9b33e-ac0c-4145-96c9-1024df8e0472/truecrypt32/git/CastServerV7
v8pathcontroller=/media/onekey/bcc9b33e-ac0c-4145-96c9-1024df8e0472/truecrypt32/git/CastControllerV8
v7pathcontroller=/media/onekey/bcc9b33e-ac0c-4145-96c9-1024df8e0472/truecrypt32/git/CastController
echo $v7path


mkdir -p castserver/res/values
mkdir -p castserver/res/values-en
mkdir -p castcontroller/res/values
mkdir -p castcontroller/res/values-en

function cpcontroller()
{
	cp $1/res/values/strings-controller.xml castcontroller/res/values/
	cp $1/res/values-en/strings-controller.xml castcontroller/res/values-en/
}

cpserver $v7path
cpcontroller $v7pathcontroller

zip -r res.zip castcontroller/ castserver/
