FROM continuumio/miniconda
WORKDIR /app

# Create the environment:
COPY environment.yml .
RUN conda env create -f environment.yml

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "myJenkinsEnv", "/bin/bash", "-c"]

# Demonstrate the environment is activated:
RUN echo "Make sure flask is installed:"
RUN python -c "import flask"

# The code to run when container is started:
COPY run.py .
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "myJenkinsEnv", "python", "run.py"]

# COPY ./ ./
# RUN conda env create -f environment.yml

# # Make RUN commands use the new environment:
# SHELL ["conda", "run", "--no-capture-output", "-n", "myenv", "/bin/bash", "-c"]

# COPY requirements.txt hello_there.py ./
# RUN apk add --no-cache python3-dev openssl-dev libffi-dev gcc && pip3 install --upgrade pip
# # RUN pip3 install -r requirements.txt
# RUN pip install requests
# CMD [ "python","hello_there.py" ]