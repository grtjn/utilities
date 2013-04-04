#!/bin/bash

if [ "$1" == "" ] || [ "$2" == "" ]; then
	echo "";
	echo "Usage: $0 [Release version] [Next dev version]";
	echo "";
	exit
fi

RELVERSION=$1
DEVVERSION=$2

echo ""
echo "Delete release tag tag-v$RELVERSION.."
git tag -d tag-v$RELVERSION
#if [ $? -gt 0 ]; then
#	echo "";
#	echo "Rollback failed!";
#	echo "";
#	exit
#fi

echo ""
echo "Push tag changes to remote.."
git push origin --tags
if [ $? -gt 0 ]; then
	echo "";
	echo "Rollback failed!";
	echo "";
	exit
fi

echo ""
echo "Delete release branch v$RELVERSION.."
git branch -D v$RELVERSION
#if [ $? -gt 0 ]; then
#	echo "";
#	echo "Rollback failed!";
#	echo "";
#	exit
#fi

echo ""
echo "Delete release branch v$RELVERSION.."
git push origin --delete v$RELVERSION
#if [ $? -gt 0 ]; then
#	echo "";
#	echo "Rollback failed!";
#	echo "";
#	exit
#fi

echo ""
echo "Rollback succesful!"
echo ""
