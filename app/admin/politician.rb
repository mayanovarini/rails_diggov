ActiveAdmin.register Politician do

  sidebar "Details", only: [:show, :edit] do
    ul do
      li link_to "Reviews",    admin_politician_reviews_path(resource)
    end
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :politician, :first_name, :last_name, :party, :occupation, :country, :area, :wikipage, :image

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

filter :first_name
filter :last_name
filter :party
filter :occupation
filter :area
filter :country

end
