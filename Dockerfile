FROM alpine

ENV FILE_NAME=
ENV ZIP_PASSWORD=
ENV B2_KEY_ID=
ENV B2_KEY=
ENV B2_BUCKET=

VOLUME /backup

RUN apk --update --no-cache add gcompat wget p7zip && \
    wget -O /usr/bin/b2 https://github.com/Backblaze/B2_Command_Line_Tool/releases/latest/download/b2-linux && \
    chmod +x /usr/bin/b2

CMD 7z a "$FILE_NAME" /backup/* -p"$ZIP_PASSWORD" && b2 authorize-account $B2_KEY_ID $B2_KEY && b2 upload-file $B2_BUCKET "$FILE_NAME" "$FILE_NAME"
