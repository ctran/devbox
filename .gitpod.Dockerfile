# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-base/tags
FROM gitpod/workspace-base:latest

# Install Nix
CMD /bin/bash -l
USER gitpod
ENV USER gitpod
WORKDIR /home/gitpod

RUN touch .bash_profile \ 
  && curl -sSL https://nixos.org/nix/install | sh

# Update the shell configuration
RUN echo '. /home/gitpod/.nix-profile/etc/profile.d/nix.sh' >> /home/gitpod/.bashrc \
  && echo '. /home/gitpod/.nix-profile/etc/profile.d/nix.sh' >> /home/gitpod/.zshrc

RUN mkdir -p /home/gitpod/.config/nixpkgs \
  && echo '{ allowUnfree = true; }' > /home/gitpod/.config/nixpkgs/config.nix \
  && mkdir -p /home/gitpod/.config/nix \
  && echo 'extra-experimental-features = nix-command flakes' > /home/gitpod/.config/nix/nix.conf

# Install cachix
RUN . /home/gitpod/.nix-profile/etc/profile.d/nix.sh \
  && nix-env -iA cachix -f https://cachix.org/api/v1/install \
  && cachix use cachix

# # Install devbox
RUN . /home/gitpod/.nix-profile/etc/profile.d/nix.sh \
  && nix-env -iA nixpkgs.devbox

# Install nix-direnv for automatic environment setup
RUN . /home/gitpod/.nix-profile/etc/profile.d/nix.sh \
  && nix-env -i direnv \
  && direnv hook bash >> /home/gitpod/.bashrc
