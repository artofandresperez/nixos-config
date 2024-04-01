{config , pkgs , ...}:
{
  environment.systemPackages = with pkgs;[
    # git
    git
     # Information about hardware config
    lshw
    # file browser
    vifm
    # control display Brightness
    brightnessctl
    # Grep stuff
    ripgrep
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
    # markdown preview
    litemdview
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
    # Task manager
    taskwarrior
    vit
    # time tracker
    timewarrior
    # git project neofetch
    onefetch
    # better cat
    bat
    # Timer
    timer
    # font previewer
    fontpreview
    # 7zip unarchiver
    p7zip
    # make zips
    zip
    # Battery
    acpi
    #un rar
    unrar
    #steam tui
    steam-tui
    steamPackages.steamcmd
    # util
    toybox
    coreutils-full
    #tty browser 
    browsh
    # ffmpeg
    ffmpeg
    # Himalaya email client
    himalaya
    # file change run commands
    entr
    # Read and edit metadata
    exiftool
    # TUI browser
    browsh
    # - interacitve cheat sheet
    navi
    tldr
    # correct
    thefuck


    






    
  ];


}
