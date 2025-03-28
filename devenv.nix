{ pkgs, ... }: {
  name = "freeyourtech.org";
  packages = [
    pkgs.zola
    pkgs.onefetch
  ];
  languages.nix.enable = true;
  enterShell = ''
    onefetch
  '';
  processes.zola.exec = "zola serve";
}
