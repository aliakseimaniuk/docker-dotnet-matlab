# Builds docker container with dotnet runtime and Matlab Runtime(R2019b Update5).
FROM microsoft/dotnet:runtime

RUN apt-get update && \
  apt-get install -y wget unzip

ARG zip=MATLAB_Runtime_R2019b_Update_5_glnxa64.zip

# Install MatLab runtime into /usr/local/MATLAB/MATLAB_Runtime/v97
RUN mkdir /mcr-install && cd /mcr-install &&  \
  wget -O ${zip} -cnv https://ssd.mathworks.com/supportfiles/downloads/R2019b/Release/5/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_R2019b_Update_5_glnxa64.zip  && \
  unzip -q ${zip} && \
  ./install -mode silent -agreeToLicense yes && \
  rm -rf /mcr-install

# Note 1: if you want to install matlab from the already downloaded zip archive,
# uncomment the lines below and comment lines with RUN command above.
#
# Note 2: MATLAB_Runtime_R2019b_Update_5_glnxa64.zip have to be located in the
# same directory as Dockerfile.
#
#RUN mkdir /mcr-install
#ADD $zip /mcr-install/${zip}
#RUN cd /mcr-install &&  \
#    unzip -q ${zip} && \
#    ./install -mode silent -agreeToLicense yes && \
#    rm -rf /mcr-install
