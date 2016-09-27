#
# Enables local Perl module installation on Mac OS X and defines aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[perl] )); then
  return 1
fi

#
# Local Module Installation
#

if [[ "$OSTYPE" == darwin* ]]; then
  # Perl is slow; cache its output.
  cache_file="${0:h}/cache.zsh"
  perl_path="/usr/local/perl"

  if [[ -f "$perl_path/lib/perl5/local/lib.pm" ]]; then
    if [[ ! -s "$cache_file" ]]; then
      perl -I$perl_path/lib/perl5 -Mlocal::lib=$perl_path >! "$cache_file"
    fi

    source "$cache_file"
  fi

  unset perl_path
  unset cache_file
fi

#
# Load perlbrew
#

[[ "$PERLBREW_ROOT" && -f "$PERLBREW_ROOT/etc/bashrc" ]] && source "$PERLBREW_ROOT/etc/bashrc"

#
# Aliases
#

# General
alias pl='perl'
alias pld='perldoc'
alias ple='perl -wlne'

# Perlbrew
alias plb='perlbrew'
alias plba='perlbrew available'
alias plbi='perlbrew install'
alias plbl='perlbrew list'
alias plbo='perlbrew off'
alias plbO='perlbrew switch-off'
alias plbs='perlbrew switch'
alias plbu='perlbrew use'
alias plbx='perlbrew uninstall'
