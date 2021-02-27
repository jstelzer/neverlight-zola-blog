#!/usr/bin/env bash
export TEMPLATE_NAME=$1
cat << EOF > content/${TEMPLATE_NAME}.md
+++
title = "${TEMPLATE_NAME}"
date = 2021-02-25
template = "${TEMPLATE_NAME}.html"
+++
EOF


if [ -z ${TEMPLATE_NAME} ] ; then
  echo "Usage: $0 <template_name>"
  exit 3
fi

# Sanity check for consistency.

if [ ! -f templates/${TEMPLATE_NAME}.html ] ; then
	echo "I cant find templates/${TEMPLATE_NAME}.html"
	exit 2
fi

if [ ! -d static/img/${TEMPLATE_NAME} ] ; then
	echo "The images dir isn't where I expected it under  static/img/${TEMPLATE_NAME}"
	exit 3
fi

if [ -d static/img/${TEMPLATE_NAME}/static ]; then
  echo "Nuking generated cruft."
  rm -rf static/img/${TEMPLATE_NAME}/static
fi
echo "Fixing generated thumbnails dir."
perl -i -pe "s#thumbnails/#/img/${TEMPLATE_NAME}/thumbnails/#g" templates/$TEMPLATE_NAME.html
echo Fixing generated img tags.
perl -i -pe "s#src=\"img#src=\"/img#g;" templates/${TEMPLATE_NAME}.html
echo Fixing generated hrefs
perl -i -pe "s#href=\"#href=\"/img/${TEMPLATE_NAME}/#g" templates/$TEMPLATE_NAME.html

echo Now go fix the generated content/${TEMPLATE_NAME}.md