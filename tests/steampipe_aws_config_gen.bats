#!/usr/bin/env bash

run() {
  output="$($@ 2>&1)"
  status=$?
}

@test "generates connection blocks with hyphenated profile names converted to underscores" {
  stub_dir=$(mktemp -d)
  cat <<'STUB' > "$stub_dir/aws"
#!/usr/bin/env bash
echo default
echo my-profile
echo nohyphen
STUB
  chmod +x "$stub_dir/aws"
  PATH="$stub_dir:$PATH" run ./scripts/steampipe_aws_config_gen.sh
  [[ $status -eq 0 ]]
  [[ "$output" == *'connection "my_profile"'* ]]
  [[ "$output" == *'profile = "my_profile"'* ]]
  [[ "$output" == *'connection "nohyphen"'* ]]
  [[ "$output" == *'regions = ["us-east-*", "us-west-*", "eu-west-*","eu-central-1", "eu-north-1"]'* ]]
}
