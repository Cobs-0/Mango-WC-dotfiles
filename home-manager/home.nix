{ config, pkgs, lib, ... }: {
  home.username = "ciano";
  home.homeDirectory = "/home/ciano";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    pywal
    adwaita-icon-theme
  ];

  # dunst - notifications
  services.dunst = {
    enable = true;
    configFile = "${config.home.homeDirectory}/.cache/wal/dunstrc";
  };

  # Use Pywal to combine your base config and your colors together
  xdg.configFile."wal/templates/dunstrc".text = ''
    [global]
    corner_radius=10
    font="JetBrainsMono Nerd Font 14"
    force_xwayland=no
#    icon_theme = Adwaita
#    enable_recursive_icon_lookup = true
    icon_path = /run/current-system/sw/share/icons/Adwaita/32x32/status/:/run/current-system/sw/share/icons/Adwaita/32x32/devices/:/run/current-system/sw/share/icons/Adwaita/32x32/legacy/
    min_icon_size = 64
    max_icon_size = 64
    format="<b>%s</b>\n%b"
    frame_width=2
    gap_size=5
    
    # Dynamic Geometry Settings
    width=(0, 400)
    height=(0, 300)
    word_wrap=yes
    padding=15
    horizontal_padding=15
    
    icon_position="left"
    layer="overlay"
    max_icon_size=128
    enable_recursive_icon_lookup = true
    offset=(20,20)
    origin="top-right"

    frame_color = "{color4}"
    separator_color = "{color4}"

    [urgency_low]
    timeout=5
    background = "{background}E6"
    foreground = "{foreground}"

    [urgency_normal]
    timeout=8
    background = "{background}E6"
    foreground = "{foreground}"

    [urgency_critical]
    timeout=0
    background = "{color1}E6"
    foreground = "{foreground}"
    frame_color = "{color1}"
  '';

#  programs.foot.settings = {
#     main = {
#     include = "${config.xdg.cacheHome}/wal/colors-foot.ini";
#     font = "JetBrainsMono Nerd Font:size=16";
#     pad = "10";
#   };
# };

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 48;
  };

  home.sessionVariables = {
    WAYLAND_CURSOR_THEME = "Adwaita";
    WAYLAND_CURSOR_SIZE = "48";
  };
}
