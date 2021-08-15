FROM python:3.8-alpine3.12

LABEL maintainer="aoao p@eng.cx"

ADD work /work
WORKDIR /work
RUN pip install requests \
    && chmod +x crontab.sh start.sh \
    && echo "6 */6 * * * /work/crontab.sh >> /work/crontab.log" >> /etc/crontabs/root

ENV id="your id"
ENV secret="your secret"
ENV refresh_token="your refresh_token"

CMD /work/start.sh