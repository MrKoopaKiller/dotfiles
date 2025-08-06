#!/usr/bin/env bash
# Minimal bats runner for environments without bats-core
file="$1"
if [[ -z "$file" ]]; then
  echo "usage: bats <file>" >&2
  exit 1
fi
status=0
tests=()
current_func=""
body=""
pre=""
while IFS= read -r line || [[ -n "$line" ]]; do
  if [[ $line =~ ^@test[[:space:]]+\"([^\"]+)\"[[:space:]]*\{$ ]]; then
    current_name=${BASH_REMATCH[1]}
    current_func="test_${#tests[@]}"
    tests+=("$current_func:::${current_name}")
    body=""
  elif [[ $line == "}" && -n "$current_func" ]]; then
    printf -v func_def '%s() {\n%s\n}' "$current_func" "$body"
    eval "$func_def"
    current_func=""
    elif [[ -n "$current_func" ]]; then
      body+="$line"$'\n'
    else
      pre+="$line"$'\n'
    fi
  done < "$file"
eval "$pre"
for t in "${tests[@]}"; do
  func=${t%%:::*}
  name=${t#*:::}
  echo -n "$name: "
  if "$func"; then
    echo "ok"
  else
    echo "fail"
    status=1
  fi
done
exit $status
