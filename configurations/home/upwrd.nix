{ flake, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
  ];

  # Defined by /modules/home/me.nix
  # And used all around in /modules/home/*
  me = {
    username = "upwrd";
    fullname = "Luke Davis";
    email = "lukendavis7@gmail.com";
  };

  home.stateVersion = "20.09";
}
