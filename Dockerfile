FROM python

WORKDIR /app

ADD ./app /app

EXPOSE 5000

ENTRYPOINT ["sh", "script.sh"]
