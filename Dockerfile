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

# Copy Bundler config and local gem cache before installing
COPY .bundle/ .bundle/
COPY Gemfile Gemfile.lock ./
COPY vendor/bundle/ruby/2.6.0/cache/ vendor/cache/

# Install Ruby gems
RUN bundle install --local

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
