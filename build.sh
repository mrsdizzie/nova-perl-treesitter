#!/usr/bin/env bash
set -euxo pipefail

git submodule init
git submodule update --recursive --remote

cp ./src/Makefile ./src/tree-sitter-perl/
cd ./src/tree-sitter-perl

npm i -D 2>/dev/null
npm i -D tree-sitter-cli

npx tree-sitter generate
../compile_parser.sh "$PWD" "/Applications/Nova.app"

mv libtree-sitter-perl.dylib ../../perl.novaextension/Syntaxes/

cd "$OLDPWD"
