FROM python:3-slim
LABEL maintainer="paul.basil@gmail.com"
ENV PROJECT_ROOT /apps
WORKDIR $PROJECT_ROOT
COPY requirements.txt requirements.txt
COPY hello.py hello.py
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["hello.py"]	