#!/usr/bin/env bash
# Steampipe config generator

profiles=$(aws configure list-profiles | sed 's/-/_/g' )

for i in $profiles; do
  echo "connection \"$i\" {
  plugin  = \"aws\"
  profile = \"$i\"
  regions = [\"us-east-*\", \"us-west-*\", \"eu-west-*\",\"eu-central-1\", \"eu-north-1\"]
}"
done