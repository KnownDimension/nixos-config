{ config, pkgs, inputs, ... }:

{

programs.git = {
  enable = true;
  lfs.enable = true;
#  package = pkgs.gitAndTools.gitFull;
  settings = {
    user.name = "KnownDimension";
    aliases = {
        ci = "commit";
        co = "checkout";
        s = "status";
        re = "rebase";
      };
  };

  signing.format = "openpgp";

};

programs.gh = {
  enable = true;
};


# home.packages = [
#  pkgs.git-credential-manager
# ];

}