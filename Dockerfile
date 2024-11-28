FROM python:latest

# Install the Hugging Face CLI
RUN pip install -U "huggingface_hub[cli]"

# Download and install gcloud CLI
RUN curl -sSL https://sdk.cloud.google.com | bash

# Copy the shell script into the container
COPY upload-model.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/upload-model.sh

# Set the entrypoint to the script
ENTRYPOINT ["/usr/local/bin/upload-model.sh"]