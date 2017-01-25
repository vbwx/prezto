#
# Provides Vim aliases & functions.
#
# Authors:
#   Bernhard Waldbrunner <vbwx01@gmail.com>
#

# Use Vim as man page viewer
function viman {
	vim -c "Man $1 $2" -c 'silent only'
}

