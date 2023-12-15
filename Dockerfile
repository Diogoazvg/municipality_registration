# Dockerfile.rails
# FROM ruby:3.2.2

# RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn postgresql-client
# # RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# WORKDIR /opt/app
# COPY . /opt/app
# RUN bundle install

# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# CMD ["rails", "server", "-b", "0.0.0.0"]


# syntax=docker/dockerfile:1
FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /municipality_registration
COPY Gemfile /municipality_registration/Gemfile
COPY Gemfile.lock /municipality_registration/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
