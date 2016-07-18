#!/bin/sh
# Script to convert TS files into Qt QM files
PATH="${PATH}:/usr/local/bin" ; export PATH

PROGDIR="`pwd`/.."
if [ ! -e "${PROGDIR}/scripts/sync-lumina.sh" ] ; then
   echo "Error: Run as ./mkrelease.sh"
   exit 1
fi


rm -rf ${PROGDIR}/qmtmp
mkdir ${PROGDIR}/qmtmp



# Now run on each file in each language
cd ${PROGDIR}/ts
for i in `find . | grep "\.ts"`
do
   NLANG="`echo $i | cut -d '/' -f 2`"
   QMNAME="`echo $i | cut -d '/' -f 3 | sed 's|.ts||g'`_$NLANG.qm"
   echo "Creating: $i ->  $QMNAME"

   /usr/local/lib/qt5/bin/lrelease $i -qm ${PROGDIR}/qmtmp/$QMNAME >/dev/null 2>/dev/null
   if [ $? -ne 0 ] ; then echo "[ERROR] Could not convert localization: $QMNAME" ; fi
done

cd ${PROGDIR}/qmtmp

echo "Creating release file..."
tar cvJf ../dist/lumina-i18n.txz . 2>/dev/null
rm -rf ${PROGDIR}/qmtmp
