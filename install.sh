MODELS_DIRECTORY=generator/gpt2/models
MODEL_VERSION=model_v5
MODEL_NAME=model-550
DOWNLOAD_URL=http://130.211.31.182:80

if [ -d "${MODELS_DIRECTORY}/${MODEL_VERSION}" ]; then
    echo "AIDungeon2 is already installed"

else
	echo "Downloading AIDungeon2 Model... (this may take a few minutes)"
    cd ${MODELS_DIRECTORY}
    mkdir ${MODEL_VERSION}
    cd ${MODEL_VERSION}
    apt-get install aria2
    aria2c -x 16 -s 32 "${DOWNLOAD_URL}/${MODEL_VERSION}/${MODEL_NAME}.data-00000-of-00001"
    wget "${DOWNLOAD_URL}/${MODEL_VERSION}/checkpoint" > /dev/null
    wget "${DOWNLOAD_URL}/${MODEL_VERSION}/encoder.json" > /dev/null
    wget "${DOWNLOAD_URL}/${MODEL_VERSION}/hparams.json" > /dev/null
    wget "${DOWNLOAD_URL}/${MODEL_VERSION}/${MODEL_NAME}.index" > /dev/null
    wget "${DOWNLOAD_URL}/${MODEL_VERSION}/${MODEL_NAME}.meta" > /dev/null
    wget "${DOWNLOAD_URL}/${MODEL_VERSION}/vocab.bpe" > /dev/null
    echo "Download Complete!"
    cd ../../../..

    pip install -r requirements.txt > /dev/null
fi
