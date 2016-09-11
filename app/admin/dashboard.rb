ActiveAdmin.register_page "Dashboard" do


  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do

          column do
            panel "Recent Politicians" do
              table_for Politician.order('id desc').limit(10) do
                column("Name")   {|pol| link_to(pol.name, admin_politician_path(pol)) }
                column("Party")  {|pol| pol.party }
                column("Country"){|pol| pol.country }
              end
            end
          end

          column do
            panel "Recent Reviews" do
              table_for Review.order('id desc').limit(10).each do
                column("Politician")  {|rev| rev.politician }
                column("Rating")      {|rev| rev.rating }
                column("Review")      {|rev| link_to(rev.comment, admin_politician_review_path(rev.politician, rev)) }
              end
            end
          end

    end # columns
  end # content
end
