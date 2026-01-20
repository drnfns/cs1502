{
while (match($0, /!\[[^]]*\]\(([^)]+\.svg)\)/, m)) {
    svg = ""
    while ((getline line < m[1]) > 0) svg = svg line
    close(m[1])
    $0 = substr($0, 1, RSTART - 1) svg substr($0, RSTART + RLENGTH)
  }
  print
}