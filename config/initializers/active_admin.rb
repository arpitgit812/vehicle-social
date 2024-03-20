# ActiveAdmin configuration
ActiveAdmin.setup do |config|
  # Site title and link
  config.site_title = "Vehicle Social App"
  # config.site_title_link = "/"

  # Site title image
  # config.site_title_image = "logo.png"

  # Load paths
  # config.load_paths = [File.join(Rails.root, 'app', 'admin'), File.join(Rails.root, 'app', 'cashier')]

  # Default namespace
  # config.default_namespace = :admin

  # User authentication and authorization
  config.authentication_method = :authenticate_admin_user!
  config.authorization_adapter = ActiveAdmin::CanCanAdapter

  # Pundit configuration
  config.pundit_default_policy = "MyDefaultPunditPolicy"
  config.pundit_policy_namespace = :admin

  # CanCanAbility class name
  # config.cancan_ability_class = "Ability"

  # On unauthorized access
  # config.on_unauthorized_access = :access_denied

  # Current user method
  config.current_user_method = :current_admin_user

  # Logout link path and method
  config.logout_link_path = :destroy_admin_user_session_path
  # config.logout_link_method = :get

  # Root path
  # config.root_to = 'dashboard#index'

  # Admin comments
  # config.comments = false
  # config.comments_registration_name = 'AdminComment'
  # config.comments_order = 'created_at ASC'
  # config.comments_menu = false

  # Batch actions
  config.batch_actions = true

  # Controller filters
  # config.before_action :do_something_awesome

  # Attribute filters
  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]

  # Localize date/time format
  config.localize_format = :long

  # Favicon
  # config.favicon = 'favicon.ico'

  # Meta tags
  # config.meta_tags = { author: 'My Company' }

  # Breadcrumbs
  # config.breadcrumb = false

  # Create another checkbox
  # config.create_another = true

  # Register stylesheets and javascripts
  # config.register_stylesheet 'my_stylesheet.css'
  # config.register_javascript 'my_javascript.js'

  # CSV options
  # config.csv_options = { col_sep: ';', force_quotes: true }

  # Menu system
  # config.namespace :admin do |admin|
  #   admin.build_menu :utility_navigation do |menu|
  #     menu.add label: "My Great Website", url: "http://www.mygreatwebsite.com", html_options: { target: :blank }
  #     admin.add_logout_button_to_menu menu
  #   end
  # end

  # Download links
  # config.namespace :admin do |admin|
  #   admin.download_links = false
  #   admin.download_links = [:xml, :pdf]
  #   admin.download_links = proc { can?(:view_download_links) }
  # end

  # Pagination
  # config.default_per_page = 30
  # config.max_per_page = 10_000

  # Filters
  # config.filters = true
  # config.include_default_association_filters = true

  # Head
  # config.head = ''.html_safe

  # Footer
  # config.footer = 'my custom footer text'

  # Sorting
  # config.order_clause = MyOrderClause

  # Webpacker
  # config.use_webpacker = true
end
