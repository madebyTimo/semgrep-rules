#!/usr/bin/env bash
set -e

DEPENDENCIES=(docker)

# check dependencies
for CMD in "${DEPENDENCIES[@]}"; do
    if [[ -z "$(which "$CMD")" ]]; then
        echo "\"${CMD}\" is missing!"
        exit 1
    fi
done

docker run --pull always --rm \
    --volume "${PWD}/src:/media/workdir" \
    madebytimo/semgrep semgrep --config rules --test test
