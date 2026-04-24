{ config, lib, pkgs, inputs, ... }:

{
  services.searx = {
    enable = true;
    redisCreateLocally = true;
    environmentFile = "/home/jacobr/.searxng.env";

    settings = {
      server = {
        bind_address = "127.0.0.1";
        port = 2050;
      };

      engines = [
        {
          name = "nixos-packages";
          engine = "xpath";
          paging = false;
          search_url = "https://search.nixos.org/packages?query={query}";
          url_xpath = "//ul/li/[@class=\"package\"]";
          title_xpath = "";
          content_xpath = "";
          shortcut = "nix";
        }
      ];
    };
  };
}
