class ApplicationController < ActionController::Base
    # devise_group :member, contains: [:pro, :user]

    # private

    # def pundit_user
    #     # Make Pundit to use whichever Devise model [Organizer, Sponsor, User] as the 'current_user'
    #     # Just by using the offered helper method from Devise, 'devise_group' feature
    #     current_member
    # end
end
