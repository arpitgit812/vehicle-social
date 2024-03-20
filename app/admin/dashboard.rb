# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }, description: "View the dashboard"

  content title: proc { I18n.t("active_admin.dashboard") } do
    # Display a welcome message and a quick link to create a new resource
    section do
      div do
        h1 I18n.t("active_admin.dashboard_welcome.welcome")
        p I18n.t("active_admin.dashboard_welcome.call_to_action")
        if active_admin_config.resource_class.respond_to?(:model)
          link_to I18n.t("active_admin.dashboard_welcome.create_resource", resource_name: active_admin_config.resource_name.downcase.humanize),
                  new_resource_path do
            span I18n.t("active_admin.dashboard_welcome.create_resource_button")
            icon 'plus'
          end
        end
      end
    end

    # Display a list of recent resources
    section "Recent Resources" do
      table_for resource_class.order(created_at: :desc).limit(10) do
        column :name do |resource|
          link_to resource.name, admin_resource_path(resource)
        end

        column :created_at

        batch_action 'Delete Selected' do |selected_resources|
          selected_
