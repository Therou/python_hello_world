FROM python:alpine3.7

RUN python3 -m pip install Flask

COPY flask_app_src.py .

EXPOSE 8100

ENTRYPOINT ["python3", "flask_app_src.py"]
