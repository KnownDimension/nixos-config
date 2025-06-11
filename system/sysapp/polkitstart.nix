
{ pkgs }:


pkgs.writeShellScriptBin "polkitstart"''
    exec systemctl start ${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1
''

#   exec systemctl start /usr/lib/polkit-kde-authentication-agent-1
#  5vc0ch5mcqjcpa1fcw6hvl8hxi6629sx-polkit-kde-agent-1-5.27.11

#{
#systemd.user.services.polkit-kde-authentication-agent-1.serviceConfig = {
#    ExecStart = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
#    };

#}