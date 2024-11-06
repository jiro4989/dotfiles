function fish_prompt
  set -l ret $status

  echo -n (set_color yellow)(date +"%Y-%m-%dT%H:%M:%S") (set_color cyan)(prompt_pwd)
  echo (set_color magenta)(__fish_git_prompt)
  set -l user_prompt "%"
  if test $USER = "root"
    set user_prompt "#"
  end

  set -l prompt (set_color green)"(*'-')!"(set_color white)
  if test $ret -ne 0
    set prompt (set_color red)"(;T_T)?"(set_color white)
  end
  echo "$prompt < $user_prompt "
end
