{ config, pkgs, inputs, lib, ... }:

# strawberry with ipod support as original package doesnt build with it

{

home.packages = [
    (pkgs.strawberry.overrideAttrs (oldAttrs: {
      buildInputs = oldAttrs.buildInputs ++ [pkgs.libgpod];
      cmakeFlags = [ (lib.cmakeBool "ENABLE_GPOD" true) ];


    }))
   ];

}