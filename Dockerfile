FROM node:18 AS builder

MAINTAINER ashok @xyloinc.com


RUN apt-get update 

RUN git clone https://YuvanPraveen2001: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@github.com:/XYLO-DEV/xylo-trade-manager-UI.git 
WORKDIR xylo-trade-manager-UI
 
COPY package*.json ./

RUN npm install -g npm@9.6.7 && \
    npm install -g @angular/cli && \
    npm i --force  

COPY . .

# Build the Angular app
RUN npm run build


   # ng build --configuration=production      	#--output-path= xylo-trade-manager-UI/dist

FROM nginx:latest
#COPY /nginx-custom.conf  /etc/nginx/conf.d/default.conf
COPY --from=builder xylo-trade-manager-UI/dist /usr/share/nginx/html




#EXPOSE 80

#CMD ["nginx", "-g", "daemon off;"]


