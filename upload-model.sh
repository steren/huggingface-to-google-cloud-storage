#!/bin/bash

# Download the model using the Hugging Face CLI
huggingface-cli login --token "$HUGGINGFACE_TOKEN"
huggingface-cli download $REPO $FILE --local-dir .

# Upload the model to Cloud Storage using gsutil
gcloud storage cp $FILE  $GCS_DESTINATION"

echo "$FILE uploaded to $GCS_DESTINATION"