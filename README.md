lumina-i18n
===========

i18n files for Lumina, created from http://translate.pcbsd.org

To install these translation files, just extract the dist/lumina-i18n.txz file into ${PREFIX]/share/Lumina-DE/i18n (you may need to create that directory first). Then the next time you log in to the Lumina desktop environment it will read the system locale and load the appropriate translation files.

Example (FreeBSD):

`tar xvf <local copy of repo>/dist/lumina-i18n.txz -C /usr/local/share/Lumina-DE/i18n`

In the "x11/lumina-i18n" FreeBSD port (with staging and such) it runs these two commands to do the intallation:

`${MKDIR} ${STAGEDIR}${PREFIX}/share/Lumina-DE/i18n`

`tar xvf ${WRKSRC}/dist/${PORTNAME}.txz -C ${STAGEDIR}${PREFIX}/share/Lumina-DE/i18n`
