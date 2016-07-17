FROM alpine:3.4

RUN apk add --no-cache py-pip && rm -rf /var/cache/apk/* /root/.cache

RUN pip install postorius

COPY postorius /postorius/

VOLUME /postorius/local

EXPOSE 8000

CMD ["python", "/postorius/manage.py", "runserver", "0.0.0.0:8000"]
