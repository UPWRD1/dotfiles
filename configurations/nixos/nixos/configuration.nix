# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Include Home Manager
    # <home-manager/nixos>
  ];
  boot = {
    loader = {

      # Use the systemd-boot EFI boot loader.
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };
  networking = {

    hostName = "nixos";
    networkmanager = {
      # Define your hostname.
      # networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.
      enable = true;
      wifi = {
        # Use networkmanager on mac
        backend = "wpa_supplicant";
        powersave = false;
      };
    };

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.wlp3s0.useDHCP = true;
  };

  # Stop boot lag?
  systemd.services.NetworkManager-wait-online.enable = false;

  # Allow unfree software, MOSTLY for Broadcom driver support on Macbook hardware

  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };

  users.users.upwrd = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

  };

  #enable polkit for sway
  security.polkit.enable = true;
  environment = {

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    systemPackages = with pkgs; [
      vim
      git
    ];
    sessionVariables.NIXOS_OZONE_WL = "1";
  };
  hardware = {
    # Hardware Support for Wayland Sway
    opengl = {
      enable = true;
    };

    # Enable Broadcom STA driver for Mac
    enableAllFirmware = true;
  };

  services = {

    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}
