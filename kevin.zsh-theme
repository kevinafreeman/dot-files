# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
# 
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys

autoload -U colors && colors

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

function time_format {
	echo "%D{%a, %b-%d-%Y @ %r}"
}

# VCS
YS_VCS_PROMPT_PREFIX1="%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2="%{$FG[077]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY="%{$reset_color%}] %{$FG[001]%}x "
YS_VCS_PROMPT_CLEAN=" %{$FG[077]%}✔ ]"

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}GIT[${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"


ZSH_THEME_SVN_PROMPT_PREFIX="${PR_RESET}${PR_RED}‹svn:"
ZSH_THEME_SVN_PROMPT_SUFFIX=""
ZSH_THEME_SVN_PROMPT_DIRTY="${VCS_DIRTY_COLOR} ✘"
ZSH_THEME_SVN_PROMPT_CLEAN="${VCS_CLEAN_COLOR} ✔"

# HG info
local hg_info='$(ys_hg_prompt_info)'
ys_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${YS_VCS_PROMPT_PREFIX1}hg${YS_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$YS_VCS_PROMPT_DIRTY"
		else
			echo -n "$YS_VCS_PROMPT_CLEAN"
		fi
		echo -n "$YS_VCS_PROMPT_SUFFIX"
	fi
}

# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $ 
PROMPT="
%{$FG[202]%}%n \
%{$FG[221]%}at \
%{$FG[202]%}$(box_name) \
%{$FG[221]%}in \
%{$terminfo[bold]$FG[yellow]%}${current_dir} %{$reset_color%}\
%{$FG[038]%}[$(time_format)]
${hg_info}\
${git_info}\
$(svn_prompt_info)\
%{$terminfo[bold]$FG[077]%}$ \
%{$reset_color%}"


if [[ "$USER" == "root" ]]; then
PROMPT="
%{$bg[001]%}%{$FG[black]%}%n%{$reset_color%} \
%{$FG[221]%}at \
%{$FG[202]%}$(box_name) \
%{$FG[221]%}in \
%{$terminfo[bold]$FG[yellow]%}${current_dir}%{$reset_color%}\
%{$FG[038]%}[$(time_format)]
${hg_info}\
${git_info}\
$(svn_prompt_info)\
%{$terminfo[bold]$FG[001]%}$ \
%{$reset_color%}"
fi
