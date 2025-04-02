#!/bin/bash
for item in agbcc poryscript/poryscript poryscript/font_config.json; do
    item_name=$(basename "${item}")
    if ! [ -e "tools/${item}" ]; then
        echo "Using ${item_name} from dev container" >&2
        ln -s "/tools/${item}" "tools/${item}"
    fi
    if [ "$(readlink -f "tools/${item}")" != "/tools/${item}" ]; then
        echo "WARNING: Not using ${item_name} from dev container" >&2
    fi
done
