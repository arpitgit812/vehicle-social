# Set the ENV variable "BUNDLE_GEMFILE" to the path of the Gemfile in the current directory
# or use the default path if it's not set.
ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

# Load the Bundler environment, which will setup the gems listed in the Gemfile.
# This will also make sure that the gems are loaded in the correct order and their dependencies are satisfied.
require "bundler/setup"

# Load the bootsnap library, which can speed up boot time by caching expensive operations.
# This line should be placed after requiring "bundler/setup" to make sure that bootsnap is loaded as a gem.
require "bootsnap/setup"

# Optionally, you can add the following line to enable bootsnap's development mode,
# which can provide faster cache invalidation and better error messages.
# However, this may come at the cost of a slower boot time and more memory usage.
# Bootsnap.development!
