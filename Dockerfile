# Dockerfile

FROM dellelce/py-base as base

ARG ERRBOT=/app/errbot

RUN apk add gcc libc-dev && \
    mkdir ${ERRBOT} && \
    ${INSTALLDIR}/bin/python3 -m venv ${ERRBOT} && \
    . ${ERRBOT}/bin/activate && \
    pip install errbot slackclient

FROM dellelce/py-base as target

COPY --from=base /app/errbot /app/errbot

VOLUME ${ERRBOT}/data
