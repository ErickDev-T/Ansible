FROM ubuntu:24.04

RUN apt update && apt install -y openssh-server python3 sudo
RUN useradd -ms /bin/bash ansible && echo 'ansible:ansible' | chpasswd

# 👇 Esta línea es importante: agrega el usuario al grupo sudo sin pedir contraseña
RUN echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir /var/run/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
