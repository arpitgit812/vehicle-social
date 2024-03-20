ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # Add validation and error handling
  controller do
    def create
      @admin_user = AdminUser.new(permitted_params[:admin_user])

      if @admin_user.save
        redirect_to admin_admin_users_path, notice: 'Admin user was successfully created.'
      else
        render :new
      end
    end

    def update
      @admin_user = AdminUser.find(params[:id])

      if @admin_user.update(permitted_params[:admin_user])
        redirect_to admin_admin_users_path, notice: 'Admin user was successfully updated.'
      else
        render :edit
      end
    end
  end
end
