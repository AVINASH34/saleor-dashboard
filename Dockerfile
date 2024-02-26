FROM node:18.19.1-slim as build
RUN mkdir /temp
COPY . /temp
WORKDIR /temp
RUN npm install 


FROM node:18.19.1-slim as final
COPY --from=build /temp /temp
WORKDIR /temp
EXPOSE 9000
CMD [ "npm" , "run" , "dev" ]