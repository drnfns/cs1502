#!/bin/sh

mkdir -p docs/static

for p in ./graphs/*.gv; do
  f="$(basename "$p")"
  dot "$p" -Tsvg -o "docs/static/${f%%.gv}.svg" &
  printf '(%s) building %s...\n' "$!" "$p"
done

printf 'waiting for all jobs to finish...\n'
wait
