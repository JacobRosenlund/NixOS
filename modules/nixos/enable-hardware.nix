{ config, lib, pkgs, inputs, ...}

{
  imports = [];
  
  # Hardware Enabling
    # Sound
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };

  # Bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    services.blueman.enable = true;

  # Touchpad
    services.libinput.enable = true;
}

