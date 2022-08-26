FROM archlinux:base-devel
ARG USER=aleks
ENV HOME=/home/$USER

RUN pacman -Syu --noconfirm git

# Packman by default does not extract manpages - this deletes the line controlling this behavior
RUN sed -i  "/\\usr\\/share\\/man\\/*/d" /etc/pacman.conf 

# Create users with a home directory, add user to arch wheel group, append to sudoers with no password
RUN useradd --create-home --groups wheel -s /bin/bash $USER && echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $USER 
WORKDIR $HOME 

# Install yay 
RUN git clone https://aur.archlinux.org/yay.git \
    && cd yay \
    && makepkg -sri --needed --noconfirm \
    && cd \
    # Clean up
    && rm -rf .cache yay


# Development packages upgrade
RUN yay -Y --gendb --noconfirm && yay -Syu --devel --noconfirm && yay -T --devel --save --noconfirm

# Installation step
RUN yay -S nodejs npm nushell starship neovim man man-pages rustup cargo-edit ripgrep ctags-git python-virtualenv --noconfirm 


# Rust defualt toolchain
RUN rustup default stable


# Setup Nushell config files and permissions
COPY ./config.nu $HOME/.config/nushell/config.nu
COPY ./env.nu $HOME/.config/nushell/env.nu
RUN sudo chown $USER -R $HOME/.config/nushell && echo "nu" >> .bashrc

# Nushell env variables
ENV NUSHELL_CONFIG_PATH=$HOME/.config/nushell/config.nu
ENV NUSHELL_ENV_PATH=$HOME/.config/nushell/env.nu

# Setup Starship 
RUN printf "mkdir ${HOME}/.cache/starship \n" >> ${NUSHELL_ENV_PATH}
RUN printf "starship init nu | save ${HOME}/.cache/starship/init.nu \n" >> ${NUSHELL_ENV_PATH} 
RUN printf "source ~/.cache/starship/init.nu \n" >> ${NUSHELL_CONFIG_PATH}
COPY ./starship.toml ${HOME}/.config/starship.toml 


# Neovim setup
# Set editor and visual to point to nvim
RUN printf "let-env VISUAL = 'nvim' \n" >> ${NUSHELL_CONFIG_PATH}
RUN printf "let-env EDITOR = 'nvim' \n" >> ${NUSHELL_CONFIG_PATH}
RUN echo "VISUAL = 'nvim'" >> $HOME/.bashrc
RUN echo "EDITOR = 'nvim'" >> $HOME/.bashrc

# Copy everything from Neovim folder to .config
COPY ./nvim $HOME/.config/nvim
RUN sudo chown $USER -R $HOME/.config/nvim

CMD ["bash"]
