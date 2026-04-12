{ config, pkgs, ... }:
{
    imports = [
        (import "${home-manager}/nixos")
    ];

     wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty"; 
      startup = [
        # Launch Firefox on start
        {command = "firefox";}
      ];
    };
  };

    home-manager.users.upwrd = {
        # This should be the same value as `system.stateVersion` in
        # your `configuration.nix` file.
        home.stateVersion = "25.11";

        home.file = {
          ".config/helix/config.toml".source = ./sources/helix/config.toml;
        };
    };
}
