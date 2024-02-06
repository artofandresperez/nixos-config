{config , pkgs , ...}:
{
  environment.systemPackages = with pkgs;[
    # CLI browser
    lynx
     # Information about hardware config
    lshw
    # file browser
    vifm
    # control display Brightness
    brightnessctl
    # Grep stuff
    ripgrep
    # email client
    mutt
    # Calculator
    kalker
    # file usage manager
    du-dust
    # file difference viewer
    diff-so-fancy
    #find duplicate files
    fdupes
    # file transfer cli
    croc 
    # email client
    mutt
    # Journaling Cli
    jrnl
    # Cli benchmarking tool
    hyperfine
    # accounting 
    hledger
    # bookmarks manager
    buku
    # System Monitor 
    btop
    # fuzzy finder
    fzf
    #downloads 
    wget
    #github
    gh
    #markdown render
    glow
    # unzipping .zip files
    unzip
    # easy cli for mounting drives
    bashmount
    # check usb devices
    usbutils
    #test events
    evtest
    # git manager cli
    lazygit
    #exfat utils
    exfat
    # ntfs utils
    ntfs3g
    # Video player
    mpv
  ];


}
