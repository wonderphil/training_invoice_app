FROM ruby:2.7.1
LABEL maintainer="Philip Davies <me@daviesp.co.uk>"

RUN cat /etc/*release
#RUN printenv
# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
# because node is shit
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs
RUN apt-get update  && apt-get install -qq -y build-essential libpq-dev --fix-missing --no-install-recommends
# Unknow reason this wouldnt install psql client inless it was in its own line :(
RUN apt-get install -y postgresql-client-11 --fix-missing --no-install-recommends
RUN apt-get install -y nano --fix-missing --no-install-recommends
RUN apt-get install -y graphviz --fix-missing --no-install-recommends

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /app
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs
# RUN bundle binstubs

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

# The default command that gets ran will be to start the Unicorn server.
CMD ["/bin/bash", "./startup.sh"]