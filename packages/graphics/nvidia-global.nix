{config , pkgs , ...}:
{
  environment.systemPackages = with pkgs;[
    # GPU system process monitor
    nvtop
    # GPU things
    cudatoolkit
    linuxPackages.nvidia_x11
    libGLU
    libGL

  ];

  nixpkgs.config.nvidia.acceptLicense = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with  pkgs; [
    	intel-media-driver
      vaapiIntel
	    vaapiVdpau
	    libvdpau-va-gl

    ];

  };



}
