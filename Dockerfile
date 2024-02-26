FROM gcr.io/distroless/nodejs20:debug-nonroot as build
RUN mkdir /temp
COPY . /temp
WORKDIR /temp
RUN npm install 


FROM gcr.io/distroless/nodejs20:debug-nonroot as final
COPY --from=build /temp /temp
WORKDIR /temp
EXPOSE 9000
CMD [ "npm" , "run" , "dev" ]