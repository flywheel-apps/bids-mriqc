# Use the latest Python 3 docker image
FROM poldracklab/mriqc:0.15.2

MAINTAINER Flywheel <support@flywheel.io>

RUN apt-get update && apt-get install -y zip && rm -rf /var/lib/apt/lists/*

RUN npm install -g bids-validator@1.5.7

COPY requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt && \
    rm -rf /root/.cache/pip

# Make directory for flywheel spec (v0)
ENV FLYWHEEL /flywheel/v0
WORKDIR ${FLYWHEEL}

# Save docker environ
ENV PYTHONUNBUFFERED 1
RUN python -c 'import os, json; f = open("/tmp/gear_environ.json", "w"); json.dump(dict(os.environ), f)'

# Copy executable/manifest to Gear
COPY manifest.json ${FLYWHEEL}/manifest.json
COPY utils ${FLYWHEEL}/utils
COPY run.py ${FLYWHEEL}/run.py

# Configure entrypoint
RUN chmod a+x /flywheel/v0/run.py
ENTRYPOINT ["/flywheel/v0/run.py"]
