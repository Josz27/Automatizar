FROM node 

RUN mkdir -p /opt/app

WORKDIR /opt/app

COPY package.json .
RUN npm install --quiet

RUN npm install nodemon -g --quiet

COPY . .

EXPOSE 8000

CMD nodemon -L --watch . app.js


FROM mysql

ENV MYSQL_ROOT_PASSWORD 123  
ENV MYSQL_DATABASE JOSELUIS  
ENV MYSQL_USER users_service  
ENV MYSQL_PASSWORD 123

ADD abarrotes.sql /docker-entrypoint-initdb.d