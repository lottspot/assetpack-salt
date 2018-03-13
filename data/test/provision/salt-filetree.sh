#!/bin/sh

set -e

formula_name=${project_name}

salt_path_states=/salt/states
salt_path_pillar=/salt/pillar
salt_path_formula=$salt_path_states/$formula_name
salt_top_state=$salt_path_states/top.sls

src_path=/vagrant
src_path_test=$src_path/test
src_path_pillar=$src_path_test/pillar

test -e $salt_path_states  || mkdir -pv $salt_path_states
test -e $salt_path_formula || ln -sv $src_path $salt_path_formula

if ! [ -e $salt_top_state ]; then
  cat <<EOF > $salt_top_state
base:
  '*':
    - '$formula_name'
EOF
fi

# -e will return false if symlink points to non-existent file
if ! readlink $salt_path_pillar; then
  pillar_container=$(dirname $salt_path_pillar)
  test -e $pillar_container || mkdir -pv $pillar_container
  ln -sv $src_path_pillar $salt_path_pillar
fi
