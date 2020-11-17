# docker-elasticsearch

Docker image of [Elasticsearch](https://www.elastic.co/elasticsearch/) working on ARM (especially on the Raspberry Pi).

# Image

- get from [Docker Hub](https://hub.docker.com/r/barasher/elasticsearch-arm/tags) : `docker pull barasher/elasticsearch-arm:7.10.0` (the tag corresponds to the Elasticsearch version)
- build from Dockerfile : `docker build -t barasher/elasticsearch-arm:7.10.0 .`

# Run image

`docker run --name=elasticsearch --rm -it -p 9200:9200 -p 9300:9300 barasher/elasticsearch-arm:7.10.0`

Elasticsearch configuration folder is located in the folder `/etc/elasticsearch`.
