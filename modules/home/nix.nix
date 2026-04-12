{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = [
    config.nix.package
  ];
  nix = {
    # To use the `nix` from `inputs.nixpkgs` on templates using the standalone `home-manager` template

    # `nix.package` is already set if on `NixOS` or `nix-darwin`.
    # TODO: Avoid setting `nix.package` in two places. Does https://github.com/juspay/nixos-unified-template/issues/93 help here?
    package = lib.mkDefault pkgs.nix;

    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
