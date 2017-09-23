#Creates docker container with dotnet runtime and Matlab Runtime(R2016b)

FROM microsoft/dotnet:runtime

# Matlab needs GStreamer to execute audioread function.
RUN apt-get update && \
    apt-get install -y curl wget xorg zip unzip bzip2 && \
    apt-get install -y gstreamer1.0-plugins-*

# Install MatLab runtime.
RUN mkdir /mcr-install && cd /mcr-install &&  \
    wget -nv http://ssd.mathworks.com/supportfiles/downloads/R2016b/deployment_files/R2016b/installers/glnxa64/MCR_R2016b_glnxa64_installer.zip  && \
    unzip MCR_R2016b_glnxa64_installer.zip && \
    ./install -mode silent -agreeToLicense yes && \
    rm -Rf /mcr-install

# 1. In case you want to install matlab from the already downloaded zip archive, uncomment following lines.
# 2. Comment 'install matlab from the web' lines above.
#
# NOTE: MCR_R2016b_glnxa64_installer.zip have to be located in the save directory as Dockerfile.
#
#RUN mkdir /mcr-install
#ADD ./MCR_R2016b_glnxa64_installer.zip /mcr-install/MCR_R2016b_glnxa64_installer.zip
#RUN cd /mcr-install &&  \
#    unzip MCR_R2016b_glnxa64_installer.zip && \
#    ./install -mode silent -agreeToLicense yes && \
#    rm -Rf /mcr-install
