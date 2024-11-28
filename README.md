# huggingface-to-google-cloud-storage
Script to download from Hugging Face and upload to Cloud Storage

Expected environment variables:

* `HUGGINGFACE_TOKEN` : Hugging Face API token.
* `REPO`: model on Hugging Face (e.g. `HuggingFaceH4/zephyr-7b-beta`)
* `FILE`: file to download and upload from the model (e.g. `model-00001-of-00002.safetensors`)
* `GCS_DESTINATION`: Cloud Storage URL of the bucket and path. (e.g. `gs://example-bucket/models/checkpoints/`)

## Deploy as a Cloud Run job

```
gcloud run jobs deploy upload-model \
  --region us-central1 \
  --project steren-gpu \
  --source . \
  --cpu 8 \
  --memory 32Gi \
  --set-env-vars HUGGINGFACE_TOKEN="<token>" \
  --set-env-vars REPO="black-forest-labs/FLUX.1-dev" \
  --set-env-vars FILE="flux1-dev.safetensors" \
  --set-env-vars GCS_DESTINATION="gs://<bucket>/models/checkpoints/" \
  --execute-now

```

## Run locally

You need to inject `GOOGLE_APPLICATION_CREDENTIALS`, see [here](https://cloud.google.com/run/docs/testing/local#docker-with-google-cloud-access)

```
docker build -t upload-model .
docker run -e HUGGINGFACE_TOKEN=<your_huggingface_token> -e REPO=<repo> -e FILE=<file> -e GCS_DESTINATION=<destination> -e GOOGLE_APPLICATION_CREDENTIALS ... upload-model
```