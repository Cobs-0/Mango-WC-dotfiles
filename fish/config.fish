set -g fish_greeting
set -g fish_color_cwd d79921
set -g fish_term24bit 1
set -g fish_key_bindings fish_vi_key_bindings
set -gx BROWSER /usr/bin/brave

if status is-interactive; and not set -q KITTY_WEATHER_POPUP
    # Commands to run in interactive sessions can go here
    zoxide init --cmd cd fish | source   
end

