FROM python:3.8.12-alpine
COPY requirements.txt hello_there.py ./
RUN apk add --no-cache python3-dev openssl-dev libffi-dev gcc && pip3 install --upgrade pip
# RUN pip3 install -r requirements.txt
RUN pip install requests
CMD [ "python","hello_there.py" ]