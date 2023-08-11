FROM mcr.microsoft.com/mssql/server:2022-latest
USER root
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Password1

COPY sql/ ./

RUN chmod +x dbinit.sh

CMD exec /bin/bash ./entrypoint.sh
