{ pkgs, ... }:
{
  
  # services.xserver.displayManager.sessionPackages = [ pkgs.sway ];
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty";
      startup = [
        # Launch Firefox on start
        { command = "firefox"; }
      ];
    };
  };
}
