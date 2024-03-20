require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings for the development environment.

  # Reload classes and recompile coffee scripts and assets on each request.
  config.cache_classes = false
  config.assets.compile = true
  config.assets.debug = true
  config.coffee_rails.source_map_commands = { force: true }

  # Don't eager load code on boot.
  config.eager_load = false

  # Show full error reports and notify on errors.
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false

  # Enable server timing.
  config.server_timing = true

  # Enable/disable caching based on the existence of a file.
  config.after_initialize do
    if Rails.root.join("tmp/caching-dev.txt").exist?
      config.action_controller.perform_caching = true
      config.action_controller.enable_fragment_cache_logging = true

      config.cache_store = :memory_store
      config.public_file_server.headers = {
        "Cache-Control" => "public, max-age=#{2.days.to_i}"
      }
    else
      config.cache_store = :null_store
    end
  end

  # Store uploaded files on the local file system.
  config.active_storage.service = :local

  # Don't raise errors for missing translations.
  config.i18n.raise_on_missing_translations = false

  # Don't raise errors for disallowed deprecations.
  config.active_support.disallowed_deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Reload classes in development mode.
  config.to_prepare do
    Dir.glob(Rails.root.join("app", "models", "*.rb")).each do |c|
      require_dependency(c)
    end
  end
end
