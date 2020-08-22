FROM ubuntu

ENV version 1.3.1
WORKDIR /build

ADD https://github.com/denoland/deno/releases/download/v${version}/deno-x86_64-unknown-linux-gnu.zip .
RUN apt-get update && apt-get install -y unzip
RUN unzip deno-x86_64-unknown-linux-gnu.zip 

FROM ubuntu
COPY --from=0 /build/deno /usr/local/bin/
ENTRYPOINT ["deno"]
CMD ["run"]
