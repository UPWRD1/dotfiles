{
  imports = [
    ./gnome.nix
  ];
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
  };
}
