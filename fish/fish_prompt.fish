# name: Tysyak


function __default_var
    set -q $argv[1]; or set -gx $argv
end

#__default_var __fish_git_prompt_color_prefix
#__default_var __fish_git_prompt_color_suffix
#__default_var __fish_git_prompt_color_bare
__default_var __fish_git_prompt_color_merging              red
__default_var __fish_git_prompt_color_branch               brblue
__default_var __fish_git_prompt_color_flags brred
#__default_var __fish_git_prompt_color_upstream
#
#__fish_git_prompt_describe_style       default|contains|describe|branch
__default_var __fish_git_prompt_showcolorhints             yes
__default_var __fish_git_prompt_show_informative_status    yes
__default_var __fish_git_prompt_char_stateseparator        ' '

# Unofficial fish_git_prompt settings
__default_var __fish_git_prompt_char_branch_begin          ''
__default_var __fish_git_prompt_char_branch_end            ''
__default_var __fish_git_prompt_color_branch_begin         bryellow
__default_var __fish_git_prompt_color_branch_end           bryellow

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
	set edo $status
  set_color -o blue
  printf '\033[38;5;63m%s\033[00m' (whoami)
  printf '@'

  printf '\033[38;5;69m%s ' (hostname|cut -d . -f 1)
	set_color -o cyan
	printf 'pt/%s->' (tty | cut -d / -f 4)

	set -g __fish_git_prompt_color normal
	set -g __fish_git_prompt_color_branch normal
	
	set_color normal
  printf '%s' (__fish_git_prompt)
  if [ (_is_git_dirty) ]
    printf '%s ' (__fish_git_prompt_staged)
  end

	set_color -o normal
	printf '['
  set_color -o cyan
  printf '%s' (prompt_pwd)
	set_color -o normal
	printf ']-('

	set_color -o red
  printf '%s' $edo
	set_color -o normal
	printf ')'
  
  echo

  set_color normal
  printf '$ '
  
end
