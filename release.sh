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
echo "Create release branch %RELEASE%.."
git checkout -b $RELVERSION
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
echo "Committing pom changes.."
git commit -a -m "Release $RELEASE"
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Pushing release to remote.."
git push -u origin $RELVERSION
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Switching back to development branch.."
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
git commit -a -m "Next development release $DEVVERSION"
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Pushing dev versions to remote.."
git push
if [ $? -gt 0 ]; then
	echo "";
	echo "Release failed!";
	echo "";
	exit
fi

echo ""
echo "Release succesful!"
echo ""
