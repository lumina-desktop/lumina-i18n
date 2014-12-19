#!/bin/sh
# Script to sync TS files from pcbsd git repo
PATH="${PATH}:/usr/local/bin" ; export PATH

PROGDIR="`pwd`/.."
if [ ! -e "${PROGDIR}/scripts/sync-lumina.sh" ] ; then
   echo "Error: Run as ./sync-lumina.sh"
   exit 1
fi

POPATH="${PROGDIR}/i18n/"
GITPATH="${PROGDIR}/lumina-git"
if [ -e "branch" ] ; then
  GBRANCH=`cat branch`
else
  GBRANCH="master"
fi

if [ ! -d "$GITPATH" ] ; then
   git clone -b $GBRANCH https://github.com/pcbsd/lumina.git ${GITPATH}
else
  cd ${GITPATH}
  git pull
fi

PROJECTCONF="${GITPATH}/i18n-projects"

while read line
do
  echo "$line" | grep -q "^#"
  if [ $? -eq 0 ] ; then continue ; fi

  TSNAME="`echo $line | cut -d ' ' -f 1`"
  TMODULE="${GITPATH}/`echo $line | cut -d ' ' -f 2`"
  if [ -z "$TSNAME" ] ; then continue ; fi
  if [ -z "$TMODULE" ] ; then continue ; fi

  cd ${PROGDIR}/ts
  echo "Updating: $TSNAME "
  # Now run on each file in each language
  for i in `find . | grep "/${TSNAME}.ts"`
  do
     # Update strings from project now
     cd $TMODULE
     pro=`ls *.pro`
     /usr/local/lib/qt5/bin/lupdate -silent -no-obsolete -ts ${PROGDIR}/ts/$i -pro $pro 2>/dev/null
     if [ $? -ne 0 ] ; then exit 1; fi
  done
done < ${PROJECTCONF}
