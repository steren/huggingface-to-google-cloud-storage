FROM python:latest

# Install the Hugging Face CLI
RUN pip install -U "huggingface_hub[cli]"

# Download and install gcloud CLI
# Downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

# Adding the package path to local
ENV PATH=$PATH:/usr/local/gcloud/google-cloud-sdk/bin

# Copy the shell script into the container
COPY upload-model.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/upload-model.sh

# Set the entrypoint to the script
ENTRYPOINT ["/usr/local/bin/upload-model.sh"]