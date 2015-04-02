autoload -Uz vcs_info
 
zstyle ':vcs_info:*' stagedstr '%F{yellow}: ☑%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}: §%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{red}:%f%F{yellow}%r%f'
zstyle ':vcs_info:*' enable git svn hg
precmd () {
	if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
		zstyle ':vcs_info:*' formats '%F{cyan}[%b%c%u%f%F{cyan}]%f'
	} else {
		zstyle ':vcs_info:*' formats '%F{cyan}[%b%c%u%f%F{red}â—%f%F{cyan}]%f'
	}

	vcs_info
}

### Shows prompt character according to the VCS you are currently in or super/normal user
function prompt_char {
	git branch >/dev/null 2>/dev/null && echo '±' && return
	hg root >/dev/null 2>/dev/null && echo '☿' && return
	svn info >/dev/null 2>/dev/null && echo '⚡' && return
	echo '$'
}

### Enables a nice prompt
setopt prompt_subst				# Enables various extentions for the prompt


### The left side of a normal prompt
### shows: username, hostname, (p|t)ts, working directory, standard prompt character or VCS sign; special styling for root. add this for on: 
PROMPT='%(!.%B%U%F{blue}%n%f%u%b.%F{$FG[015]%n%f) at %F{$FG[055]%m%f on %F{$FG[187]%y%f in %F{$FG[081]%~%f
${vcs_info_msg_0_} %(!.%F{red}$(prompt_char)%f.$(prompt_char)) : %{$reset_color%}'

### The right side of a normal prompt
### shows: indicator when in "normal" mode in Vi mode, date and time
RPROMPT='$(vi_mode_prompt_info) %F{$FG[012]%D{%e.%b.%Y %H:%M %p}%f%{$reset_color%}'
#                                          ^^^^^^^^^^^^^^ -> this is the part that defines date and time.

### Loop prompt
PROMPT2='{%_}  '

### Selection prompt
PROMPT3='{ â€¦ }  '

### So far I don't have any use for 'setopt xtrace', so I don't use this prompt
#PROMPT4=''