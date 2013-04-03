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

echo ""
echo "Updating release pom versions.."
mvn versions:set -DnewVersion=$RELVERSION

echo ""
echo "Build CMS release.."
mvn clean install

echo ""
echo "Pushing release to remote.."
git commit -a -m "Release $RELEASE"
git push -u origin $RELVERSION

echo ""
echo "Switching to development branch.."
git checkout master

echo ""
echo "Updating dev pom versions.."
mvn versions:set -DnewVersion=$DEVVERSION

echo ""
echo "Pushing dev versions to remote.."
git commit -a -m "Next development release $DEVVERSION"
git push

echo Release finished!
echo ""
