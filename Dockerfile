FROM gcr.io/distroless/nodejs20@sha256:635aea24f34bc83c9c0907b0b64922d18c4ddd74b330ae0909aba00f96947689 as build
RUN mkdir /temp
COPY . /temp
WORKDIR /temp
RUN npm install 


FROM gcr.io/distroless/nodejs20@sha256:635aea24f34bc83c9c0907b0b64922d18c4ddd74b330ae0909aba00f96947689 as final
COPY --from=build /temp /temp
WORKDIR /temp
EXPOSE 9000
CMD [ "npm" , "run" , "dev" ]