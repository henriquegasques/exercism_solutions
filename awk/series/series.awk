#! /usr/bin/awk -f
#
# These variables are initialized on the command line (using '-v'):
# - len

@include "assert"

BEGIN { FS="" }

{
    assert(NF > 0, "series cannot be empty")
    assert(len > 0 && len <= NF, "invalid length")

    for (i = 1; i+len <= NF+1; i++)
        printf("%s" (i+len <= NF ? OFS : ""), substr($0, i, len))
}
