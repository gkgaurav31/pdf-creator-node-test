FROM appsvc/node:14-lts_20200522.6
RUN apt update && apt install phantomjs -y
RUN apt-get install build-essential chrpath libssl-dev libxft-dev -y
RUN apt-get install libfreetype6 libfreetype6-dev -y 
RUN apt-get install libfontconfig1 libfontconfig1-dev -y
RUN cd ~ && \
export PHANTOM_JS="phantomjs-1.9.8-linux-x86_64" && \
wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 && \
tar xvjf $PHANTOM_JS.tar.bz2 && \
mv $PHANTOM_JS /usr/local/share && \
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

WORKDIR /home/site/wwwroot
COPY . /home/site/wwwroot
RUN npm i 
