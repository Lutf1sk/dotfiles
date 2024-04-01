#!/bin/bash

set -e

URL="http://localhost:7734/"
GH_URL="https://github.com/Lutf1sk/"
MAIN_C="$1/src/main.c"

mkdir "$1"

curl "$URL/makefile?name=$1" > "$1/makefile"
curl "$URL/.gitignore" > "$1/.gitignore"
curl "$URL/LICENSE" > "$1/LICENSE"

mkdir "$1/src"
echo -e "\
#include <lt/io.h>\n\n\
int main(int argc, char** argv) {\n\
\tlt_printf(\"Hello world!\\\\n\");\n\
\treturn 0;\n\
}" > $MAIN_C

git -C "$1" init
git -C "$1" submodule add "$GH_URL/lt"
