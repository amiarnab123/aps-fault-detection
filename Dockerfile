FROM python:3.8
USER root
RUN mkdir /app
COPY . /app/
WORKDIR /app/
RUN pip3 install -r requirements.txt
ENV AIRFLOW_HOME="/app/airflow"
ENV AIRFLOW_CORE_DAGBAG_IMPORT_TIMEOUT
ENV AIRFLOW_CORE_DAGBAG_ENABLE_XCOM_PICKLING=True
RUN airflow db init
RUN airflow users create -e mannaarnab2001@gmail.com -f Arnab -l Manna -p admin -r Admin -u admin
RUN chmod 777 start.sh
RUN apt update -y && apt install awscli -y
ENTRYPOINT [ "/bin/sh" ]
CMD ["start.sh"]