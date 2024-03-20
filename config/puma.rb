# Configures the minimum and maximum number of threads for Puma to use.
# Defaults to 5 threads for both minimum and maximum, which matches
# the default thread size of Active Record.
min_threads = ENV.fetch("RAILS_MIN_THREADS") { 5 }
max_threads = ENV.fetch("RAILS_MAX_THREADS") { min_threads }
threads min_threads, max_threads

# Sets the timeout threshold for Puma workers in development environments.
# If the RAILS_ENV environment variable is not set, defaults to development.
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Specifies the port that Puma will listen on for requests. Defaults to 3000.
port ENV.fetch("PORT") { 3000 }

# Specifies the environment that Puma will run in. Defaults to development.
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the file that Puma will use to store the process ID. Defaults to "tmp/pids/server.pid".
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Specifies the number of workers to boot in clustered mode.
# Workers are forked web server processes. If using threads and workers together,
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support processes).
# Uncomment and configure this line if using workers.
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
# preload_app!

# Allows Puma to be restarted by the `bin/rails restart` command.
plugin :tmp_restart
