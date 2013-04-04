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
echo "Delete release tag $RELVERSION.."
git tag -d v$RELVERSION
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
echo "Delete release branch $RELVERSION.."
git branch -D v$RELVERSION
#if [ $? -gt 0 ]; then
#	echo "";
#	echo "Rollback failed!";
#	echo "";
#	exit
#fi

echo ""
echo "Delete release branch $RELVERSION.."
git push origin --delete $RELVERSION
#if [ $? -gt 0 ]; then
#	echo "";
#	echo "Rollback failed!";
#	echo "";
#	exit
#fi

echo ""
echo "Rollback succesful!"
echo ""
