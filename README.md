lumina-i18n (ARCHIVED)
===========
**ARCHIVED:** This repository is no longer used for translation files for the Lumina desktop
All of the translations are now contained within each individual project in the [lumina repository](https://github.com/lumina-desktop/lumina).

---

i18n files for Lumina, created from http://translate.pcbsd.org

To install these translation files, just extract the dist/lumina-i18n.txz file into ${PREFIX]/share/lumina-desktop/i18n (you may need to create that directory first). Then the next time you log in to the Lumina desktop environment it will read the system locale and load the appropriate translation files.

Example (FreeBSD):

`tar xvf <local copy of repo>/dist/lumina-i18n.txz -C /usr/local/share/lumina-desktop/i18n`

In the "x11/lumina-i18n" FreeBSD port (with staging and such) it runs these two commands to do the intallation:

`${MKDIR} ${STAGEDIR}${PREFIX}/share/lumina-desktop/i18n`

`tar xvf ${WRKSRC}/dist/${PORTNAME}.txz -C ${STAGEDIR}${PREFIX}/share/lumina-desktop/i18n`
