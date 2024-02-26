FROM node:18.19.1-slim
RUN mkdir /temp
COPY . /temp
WORKDIR /temp
RUN npm install
EXPOSE 9000
CMD ["npm","run","dev"]