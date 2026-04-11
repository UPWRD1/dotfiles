{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz;
in
{
    imports = [
        (import "${home-manager}/nixos")
    ];

    home-manager.users.upwrd = {
        # This should be the same value as `system.stateVersion` in
        # your `configuration.nix` file.
        home.stateVersion = "25.11";

        home.file = {
          ".config/helix/config.toml".source = ./sources/helix/config.toml
        }
    };
}
