FROM jupyter/minimal-notebook
 
RUN pip install \
"apache-airflow[postgres,s3,snowflake]==2.0.1" \
sqlalchemy==1.3.23
 
RUN airflow db init
 
RUN airflow connections add 'my_redshift' \
    --conn-type 'Postgres' \
    --conn-login 'ds_lance' \
    --conn-password 'password' \
    --conn-host 'bi-dw-instance.cqutp4iwqhnr.us-east-1.redshift.amazonaws.com' \
    --conn-port '5439' \
    --conn-schema 'zoomdwhdb'
