{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    koreader
    (symlinkJoin {
      name = "calibre-with-openssl";
      paths = [ calibre ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/calibre \
          --prefix LD_LIBRARY_PATH : ${openssl.out}/lib
      '';
    })
  ];
}
