class NotificationMailer < ApplicationMailer
  default from: "no-reply@digdig.herokuapp.com"

  def review_added(review)
    @politician = review.politician
    @politician_owner = @politician.user

    mail(to: @politician_owner.email,
         subject: "A review has been added to the profile of #{@politician.first_name} #{@politician.last_name} you created")
  end
end
