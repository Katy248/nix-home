#!/bin/bash

RUN_FLAGS="--quiet"

if [[ "$VERBOSE" ]]; then
    RUN_FLAGS=""
fi

repos=("https://github.com/katy248/ksc:$HOME/src/ksc")

for repo in repos; do
    verboseEcho "Repo" $repo

    if ! [ -d "${repo[0]}" ]; then
        run $RUN_FLAGS git clone https://github.com/katy248/ksc $HOME/src/ksc
    fi

done
