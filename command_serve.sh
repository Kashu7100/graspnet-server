if [ ! -f "checkpoint-rs.tar" ]; then
    pip install gdown
    # Define the Google Drive file ID
    FILE_ID="1hd0G8LN6tRpi4742XOTEisbTXNZ-1jmk"
    # Define the output file name
    OUTPUT_FILE="checkpoint-rs.tar"

    # Download the file using gdown
    gdown --id "$FILE_ID" -O "$OUTPUT_FILE"
fi

python serve.py --checkpoint_path checkpoint-rs.tar
