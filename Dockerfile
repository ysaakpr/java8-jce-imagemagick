FROM ubuntu:16.04
RUN apt-get -y update && apt-get install -y software-properties-common python-software-properties \
  openssl \
  imagemagick \
  jmagick \
&& add-apt-repository -y ppa:webupd8team/java \
&& apt-get -y update \
&& echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
&& apt-get install -y oracle-java8-installer \
&& apt-get install -y oracle-java8-set-default \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /var/cache/oracle-jdk8-installer

# This is a special step to install the unlimited strength JCE
RUN rm  /usr/lib/jvm/java-8-oracle/jre/lib/security/US_export_policy.jar  /usr/lib/jvm/java-8-oracle/jre/lib/security/local_policy.jar || echo "Unable to remove existing files!"
COPY UnlimitedJCEPolicyJDK8/*.jar /usr/lib/jvm/java-8-oracle/jre/lib/security/
 
# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle


