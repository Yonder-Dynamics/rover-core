FROM redis:4.0.11-alpine

COPY ./redis.conf /conf/redis.conf

CMD ["redis-server", "/conf/redis.conf"]