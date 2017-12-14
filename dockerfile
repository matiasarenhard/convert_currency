FROM ruby:2.3-slim
# Instala  dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev
# Seta  path
ENV INSTALL_PATH /usr/src/app
# Cria  diretório
RUN mkdir -p $INSTALL_PATH
# Seta o  path como o diretório principal
WORKDIR $INSTALL_PATH
# Copia o  Gemfile para dentro do container
COPY Gemfile ./
# Instala as Gems
RUN bundle install
# Copia código para dentro do container
COPY . .
