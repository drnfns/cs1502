#!/bin/sh

cd docs || exit

for p in ./*.md; do
  awk -i inline -f ../inline-svg.awk "$p"
  printf '(%s) preprocessing %s...\n' "$!" "$p"
done

printf 'waiting for all jobs to finish...\n'
wait
