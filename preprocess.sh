#!/bin/sh

[ -z "$CI" ] && {
  echo "this script edits the markdown sources in place! please only run inside ci"
  exit
}

cd docs || exit

for p in ./*.md; do
  awk -i inplace -f ../inline-svg.awk "$p" &
  printf '(%s) preprocessing %s...\n' "$!" "$p"
done

printf 'waiting for all jobs to finish...\n'
wait
