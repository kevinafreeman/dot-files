### Enables a nice prompt
setopt prompt_subst				# Enables various extentions for the prompt


### The left side of a normal prompt
### shows: username, hostname, (p|t)ts, working directory, standard prompt character or VCS sign; special styling for root. add this for on: 
PROMPT='%(!.%B%U%F{blue}%n%f%u%b.%F{$FG[015]%n%f) at %F{$FG[055]%m%f on %F{$FG[187]%y%f in %F{$FG[081]%~%f
\$: %(!.%F{red}) : %{$reset_color%}'

### The right side of a normal prompt
### shows: indicator when in "normal" mode in Vi mode, date and time
RPROMPT='$(vi_mode_prompt_info) %F{$FG[012]%D{%e.%b.%Y %H:%M %p}%f%{$reset_color%}'
#                                          ^^^^^^^^^^^^^^ -> this is the part that defines date and time.

### Loop prompt
PROMPT2='{%_}  '

### Selection prompt
PROMPT3='{ €¦ }  '

### So far I don't have any use for 'setopt xtrace', so I don't use this prompt
#PROMPT4=''
