FROM python:3.9
LABEL maintainer="Puckel_"

# Never prompt the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

# Airflow
ARG AIRFLOW_VERSION=2.2.4
ARG AIRFLOW_USER_HOME=/usr/local/airflow
ARG AIRFLOW_DEPS=""
ARG PYTHON_DEPS=""
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}
ENV PYTHON_VERSION=3.9
# For example: 3.6
ENV CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"

RUN apt-get update -yqq \
    && apt-get upgrade -yqq 

#RUN chown -R airflow: ${AIRFLOW_USER_HOME}
RUN pip3 install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"
RUN pip3 install requests

EXPOSE 8080 5555 8793

#USER airflow
WORKDIR ${AIRFLOW_USER_HOME}

#ENTRYPOINT ["/entrypoint.sh"]
CMD ["airflow", "standalone"]