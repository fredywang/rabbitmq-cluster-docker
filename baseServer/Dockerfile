FROM centos:latest
MAINTAINER FredgWang FredyWang2005@gmail.com

RUN yum install -y epel-release

RUN yum -y update

RUN yum install -y wget unzip tar telnet htop

RUN rpm -Uvh https://github.com/rabbitmq/erlang-rpm/releases/download/v20.3.8.6/erlang-20.3.8.6-1.el7.centos.x86_64.rpm

RUN yum install -y erlang

RUN rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc

RUN yum install -y  https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.7.7/rabbitmq-server-3.7.7-1.el7.noarch.rpm

RUN /usr/sbin/rabbitmq-plugins list <<<'y'
RUN /usr/sbin/rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_stomp rabbitmq_management  rabbitmq_management_agent rabbitmq_federation rabbitmq_federation_management <<<'y'

ADD rabbitmq.config /etc/rabbitmq/
ADD erlang.cookie /var/lib/rabbitmq/.erlang.cookie
ADD startrabbit.sh /opt/rabbit/

RUN chmod u+rw /etc/rabbitmq/rabbitmq.config \
&& chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie \
&& chmod 400 /var/lib/rabbitmq/.erlang.cookie \
&& mkdir -p /opt/rabbit \
&& chmod a+x /opt/rabbit/startrabbit.sh

EXPOSE 5672
EXPOSE 15672
EXPOSE 25672
EXPOSE 4369
EXPOSE 9100
EXPOSE 9101
EXPOSE 9102
EXPOSE 9103
EXPOSE 9104
EXPOSE 9105

CMD /opt/rabbit/startrabbit.sh
