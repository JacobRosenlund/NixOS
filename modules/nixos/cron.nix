{ config, lib, pkgs, inputs, ... }:

{
  services.cron = {
    enable = true;
    systemCronJobs = [ "" ];
  }
}
