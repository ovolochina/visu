#!/bin/sh

find . | egrep -i '\.po$' > po

sed -i -e 's/\.po//g' po
locales=`cat po`
rm po

out=../src/locale
mkdir -p $out

for locale in $locales; do
    echo "Processing "$locale".po ..."
    mkdir -p $out/$locale/LC_MESSAGES
    msgfmt --check --verbose --output-file $out/$locale/LC_MESSAGES/visu2.mo $locale.po
done