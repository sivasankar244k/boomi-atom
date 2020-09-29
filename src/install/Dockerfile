FROM boomi/rhel-java:8u261

##set default env values for a/m/c
ENV URL="https://platform.boomi.com"

CMD ["/sbin/init"]

RUN mkdir -p /home/boomi /opt/boomi/local

##allow for symbolic linking
RUN chmod o+w /usr/local/bin

## Copy startup scripts
COPY init-boomi.service /etc/systemd/system
COPY atom.service /etc/systemd/system
COPY atom /home/boomi
COPY restart.sh /home/boomi
COPY init-boomi.sh /home/boomi
COPY start-atom.sh /home/boomi
COPY stop-atom.sh /home/boomi
COPY create_profile.sh /home/boomi
COPY override_properties.sh /home/boomi
COPY scaledown.sh /home/boomi
RUN systemctl enable init-boomi.service
RUN systemctl enable atom.service
COPY probe.sh /home/boomi
COPY jmxutil/jmxterm.jar /opt/jmxutil/jmxterm.jar

EXPOSE 9090

##Install required packages
RUN yum install -y --nodocs wget crontabs sudo

##Update base image
RUN yum upgrade -y  && \
    yum autoremove -y && \
    yum clean all -y

##Install Centos Packages
COPY centos.repo /etc/yum.repos.d
RUN yum install -y --nodocs nfs-utils
RUN rm /etc/yum.repos.d/centos.repo

## Define working directory
WORKDIR /home/boomi