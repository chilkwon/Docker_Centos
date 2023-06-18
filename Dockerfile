FROM centos:7
RUN yum -y install openssh-server
RUN /bin/sh
RUN useradd remote_user && \
     echo 1234 | passwd remote_user --stdin && \
     mkdir /home/remote_user/.ssh && \
     chmod 700 /home/remote_user/.ssh
RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    /bin/sh
RUN /usr/sbin/sshd-keygen
CMD /usr/sbin/sshd -D
