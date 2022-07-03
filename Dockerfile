FROM python:3.8

# RUN apk update && apk add libpq-dev 
RUN pip install selenium
RUN apt update && apt install tzdata && cp /usr/share/zoneinfo/Europe/Zaporozhye /etc/localtime


# Create the log file to be able to run tail
RUN touch /var/log/cron.log

RUN apt -y install cron

WORKDIR /app
COPY ./src /app
ADD crontab /app
RUN /usr/bin/crontab /app/crontab
# Run the command on container startup
CMD cron && tail -f /var/log/cron.log

# RUN touch /var/log/cron.log


# CMD cron && tail -f /var/log/cron.log
# CMD ["/usr/sbin/crond", "-f", "-L", "8"]

# CMD ["python", "app.py"]