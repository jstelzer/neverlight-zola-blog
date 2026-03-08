#!/usr/bin/env bash
STATIC=../neverlight-published-blog/
rsync -av ./public/ ${STATIC}
cd ${STATIC}
git add .
git commit -a -m "Publish"
git push origin master
