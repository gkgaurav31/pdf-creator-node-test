FROM appsvc/node:14-lts_20200522.6
RUN apt update && apt install phantomjs -y
WORKDIR /home/site/wwwroot
COPY . /home/site/wwwroot
RUN npm i 
