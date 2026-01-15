#!/bin/sh

mkdir -p docs/static

for p in ./docs/*.md; do
  deno fmt "$p" --line-width=72 -q &
  printf '(%s) formatting %s...\n' "$!" "$p"
done

printf 'waiting for all jobs to finish...\n'
wait