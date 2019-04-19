#!/bin/sh
d=`date +%y%m%d-%H%M%S`
name=$d"work.txt"
echo $name
vi $name
