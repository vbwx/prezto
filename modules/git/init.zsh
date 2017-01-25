#
# Provides Git aliases and functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Bernhard Waldbrunner <vbwx01@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[git] )); then
  return 1
fi

# Load dependencies.
pmodload 'helper'

# Source module files.
source "${0:h}/alias.zsh"

# Displays differences between two branches
function git-unmerged {
	branch1=${1:-master}
	branch2=${2:-HEAD}

	echo; echo "Only in $branch1:"
	git cherry -v $branch2 $branch1

	echo; echo "Only in $branch2:"
	git cherry -v $branch1 $branch2
}
