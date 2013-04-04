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
echo "Checking if workspace is clean.."
git status
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Create release tag v$RELVERSION.."
git tag tag-v$RELVERSION
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Push tag changes to remote.."
git push origin --tags
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Create release branch v$RELVERSION.."
git checkout -b v$RELVERSION
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Updating release pom versions.."
mvn versions:set -DnewVersion=$RELVERSION
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Build CMS release.."
mvn clean install
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Add all files to branch.."
git add .
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Committing pom changes.."
git commit -a -m "Release v$RELVERSION"
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Pushing release to remote.."
git push -u origin v$RELVERSION
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Switching back to master branch.."
git checkout master
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Updating dev pom versions.."
mvn versions:set -DnewVersion=$DEVVERSION
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Committing dev pom changes.."
git commit -a -m "Next development version $DEVVERSION"
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Pushing dev versions to remote.."
git push -u origin master
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Release succesful!"
echo ""
