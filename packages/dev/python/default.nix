{config , pkgs , ...}:
let 
  my-python-packages = ps: with ps; [
  ];
in {
  environment.systemPackages = [ 
    (pkgs.python3.withPackages my-python-packages)
  ];
}
