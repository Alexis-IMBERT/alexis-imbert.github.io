# Use Debian-based Ruby image for better native gem compatibility
FROM ruby:3.2-slim

# Set working directory
WORKDIR /site

# Install dependencies (required for building gems)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Bundler
RUN gem install bundler

# Copy Gemfile and Gemfile.lock from Story 1.1
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN bundle install

# Expose port for Jekyll
EXPOSE 4000
EXPOSE 35729

# Run Jekyll with live reload
CMD ["bundle", "exec", "jekyll", "serve", \
     "--host", "0.0.0.0", \
     "--port", "4000", \
    "--livereload", \
    "--watch", \
    "--force_polling"]
