{config , pkgs , ...}:
{
  imports = [ 

  ];

  environment.systemPackages  = with pkgs;[   
    # Open source cg toolset
    davinci-resolve
    olive-editor
  ];


}
