#!/bin/sh
$(dirname $0)/git.bin "$@"
ec=$?
[ "$1" = fetch ] && [ -d .git-crypt ] || exit $ec
GNUPGHOME=/app/config/gpg/keys git-crypt unlock 2>/dev/null
exit $ec
