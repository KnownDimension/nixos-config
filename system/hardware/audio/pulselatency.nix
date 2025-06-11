# low latency audio for pulse according to thw wiki


{ config, lib, pkgs, modulesPath, ... }:

{

    environment.etc = let
        json = pkgs.formats.json {};
    in {
        "pipewire/pipewire-pulse.d/92-low-latency.conf".source = json.generate "92-low-latency.conf" {
            context.modules = [
            {
                name = "libpipewire-module-protocol-pulse";
                args = {
                pulse.min.req = "32/48000";
                pulse.default.req = "32/48000";
                pulse.max.req = "32/48000";
                pulse.min.quantum = "32/48000";
                pulse.max.quantum = "32/48000";
                };
            }
            ];
            stream.properties = {
            node.latency = "32/48000";
            resample.quality = 1;
            };
        };
    };
}