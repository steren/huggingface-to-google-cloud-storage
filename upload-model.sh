#!/bin/bash

# Print basic info to confirm all is properly configured
echo "Google Cloud CLI config:"
gcloud info

echo "Hugging Face CLI config:"
huggingface-cli env

echo "Will now download $REPO $FILE and upload to $GCS_DESTINATION"

# Download the model using the Hugging Face CLI
huggingface-cli login --token "$HUGGINGFACE_TOKEN"
huggingface-cli download $REPO $FILE --local-dir .

# Upload the model to Cloud Storage using gsutil
gcloud storage cp $FILE  $GCS_DESTINATION
