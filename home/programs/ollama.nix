{ config, pkgs, inputs, ... }:

{

  services.ollama = {
    enable = true;
    acceleration = "rocm";
  # rocmOverrideGfx = "9.0.0";
    environmentVariables = {
      HCC_AMDGPU_TARGET = "gfx900"; # used to be necessary, but doesn't seem to anymore
    };
  };


}