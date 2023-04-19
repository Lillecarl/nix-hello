{ config
, pkgs
, lib
, ... }:
let
  varName = "asdf";
in
{
  environment.systemPackages = [
    pkgs.htop
  ];
}
