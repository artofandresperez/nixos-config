{config , pkgs , ...}:
let 
  my-python-packages = ps: with ps; [
    torch
    torchsde
    torchvision
    einops
    transformers
    safetensors
    aiohttp
    pyyaml
    pillow
    scipy
    tqdm
    psutil
  ];
in {
  environment.systemPackages = [ 
    (pkgs.python3.withPackages my-python-packages)
  ];
}
