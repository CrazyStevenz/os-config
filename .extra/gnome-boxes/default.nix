{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) mapAttrs mkIf;
  cfg = config.icedos;
in
{
  virtualisation.libvirtd.enable = true;

  environment.systemPackages = [
    pkgs.gnome-boxes
  ];

  users.users = mapAttrs (user: _: {
    extraGroups = [ "libvirtd" ];
  }) cfg.users;
}
