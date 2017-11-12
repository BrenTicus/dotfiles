function fish_greeting -d "what's up, fish?"
  set_color $fish_color_autosuggestion
  fortune -s -o | cowsay -f tux
  set_color normal
end
