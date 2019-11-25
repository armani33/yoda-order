ActiveAdmin.register User do
  csv do
    column :id
    column :email
    column :referral_code
    column :referrer_id
    column :stripe_email
    column :created_at
    column :updated_at
  end

  actions :index, :show
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email
  #
  # or
  #
  # permit_params do
  #   permitted = [:email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
