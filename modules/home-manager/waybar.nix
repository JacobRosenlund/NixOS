{ ... }:

{
  programs.waybar = {
    enable = true;
    style = builtins.readFile "{pkgs.waybar}/etc/xdg/waybar/style.css";
    settings = [{
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [
	"idle_inhibitor"
	"pulseaudio"
	"network"
	"cpu"
	"memory"
	"backlight"
	"keyboard-state"
	"battery"
	"clock"
	"tray"
	# "custom/power"
      ];

      # Modules Configs
      "hyprland/workspaces" = {
        disable-scroll = true;
	all-outputs = true;
	warp-on-scroll = false;
	format = "{name}: {icon}";
	format-icons = {
	  urgent = "";
	  active = "";
	  default = "";
	};
      };
      idle_inhibitor = {
        format = "{icon}";
	format-icons = {
	  activated = "";
	  deactivated = "";
	};
      };
      pulseaudio = {
        format = "{volume}% {icon} {format_source}";
	format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
	};
        on-click = "pavucontrol";
      };
      network = {
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "{ipaddr}/{cidr} ";
        tooltip-format = "{ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };
      cpu = {
        format = "{usage}% ";
        tooltip = false;
      };
      memory = {
        format = "{}% ";
      };
      backlight = {
        format = "{}% {icon}";
        format-icons = ["" "" "" "" "" "" "" "" ""];
      };
      keyboard-state = {
        numlock = true;
	capslock = true;
	format = "{name} {icon}";
	format-icons = {
	  locked = "";
	  unlocked = "";
	};
      };
      battery = {
        states = {
            # good = 95;
            warning = 30;
            critical = 15;
        };
        format = "{capacity}% {icon}";
        format-full = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        # format-good = ""; // An empty format will hide the module
        # "format-full = "";
        format-icons = ["" "" "" "" ""];
      };
      clock = {
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };
      tray = { spacing = 10; };
      # "custom/power" = {
        # format = "⏻ ";
		# tooltip = false;
		# menu = "on-click";
		# menu-file = "$HOME/.config/waybar/power_menu.xml"; # Menu file in resources folder
		# menu-actions = {
			# shutdown = "shutdown";
			# reboot = "reboot";
			# suspend = "systemctl suspend";
			# hibernate = "systemctl hibernate";
		# };
      # };
    }];
  };
}
