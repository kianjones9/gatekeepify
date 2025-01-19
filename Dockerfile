# Use the official ubuntu image from the Docker Hub
FROM python

# Set the working directory in the container
WORKDIR /app

VOLUME [ "/app/db" ]

# Copy the current directory contents into the container at /app
COPY ./src /app
COPY ./requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Run cron.py when the container launches to pull in recent listens
ENTRYPOINT [ "python3", "/app/cron.py"]
# run with: docker build --env-file .env -t your_image_name .