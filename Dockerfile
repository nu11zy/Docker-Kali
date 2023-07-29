FROM kalilinux/kali-rolling

# Update
RUN apt -y update && apt -u autoremove && apt clean

# Install common tools
RUN apt -y install curl wget git iproute2 dnsutils whois traceroute iputils-ping netcat-traditional man-db sudo file zsh

# Install optional tools 
RUN apt -y install nano fzf rlwrap bat hexyl

# Web tools
# ...

# Configure zsh
RUN apt -y install zsh-syntax-highlighting zsh-autosuggestions
RUN mkdir -p ~/.cache/zsh
COPY ./.zshrc /root/.zshrc

# Create user
# RUN adduser --quiet --disabled-password --shell /bin/zsh --home /home/kali --gecos "User" kali
# RUN echo "kali:kali" | chpasswd
# RUN usermod -aG sudo kali

ENTRYPOINT ["/bin/zsh"]
