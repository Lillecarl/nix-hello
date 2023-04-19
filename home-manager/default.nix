{ config
, pkgs
, lib
, ... }:
let
  varName = "";
in
{
  home.username = "username";
  home.homeDirectory = "/home/username";
  home.packages = [
    pkgs.htop
  ];
  home.stateVersion = "23.05";
}
