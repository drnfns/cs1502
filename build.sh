#!/bin/sh

mkdir -p docs/static

for p in ./graphs/*.gv; do
  f="$(basename "$p")"
  (dot "$p" -Tsvg | sed -E -e s'/(fill|stroke)="black"/\1="var(--muted-fg)"/g') > "docs/static/${f%%.gv}.svg" &
  printf '(%s) building %s...\n' "$!" "$p"
done

printf 'waiting for all jobs to finish...\n'
wait
