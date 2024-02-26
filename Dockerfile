FROM gcr.io/distroless/nodejs20@sha256:835710e48978ebad01dabc5182e8847f11e9aa0d0e1a703792efe396aaee3c67 as build
RUN mkdir /temp
COPY . /temp
WORKDIR /temp
RUN npm install 


FROM gcr.io/distroless/nodejs20@sha256:835710e48978ebad01dabc5182e8847f11e9aa0d0e1a703792efe396aaee3c67 as final
COPY --from=build /temp /temp
WORKDIR /temp
EXPOSE 9000
CMD [ "npm" , "run" , "dev" ]