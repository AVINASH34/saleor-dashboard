FROM gcr.io/distroless/nodejs20:sha256-1fb9bba88d04119eaea7ff68e27576c6ff1c224580695abe61abc49c77f3c7a1.att as build
RUN mkdir /temp
COPY . /temp
WORKDIR /temp
RUN npm install 


FROM gcr.io/distroless/nodejs20:sha256-1fb9bba88d04119eaea7ff68e27576c6ff1c224580695abe61abc49c77f3c7a1.att as final
COPY --from=build /temp /temp
WORKDIR /temp
EXPOSE 9000
CMD [ "npm" , "run" , "dev" ]