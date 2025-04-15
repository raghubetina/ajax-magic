class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_current_user

  def set_current_user
    if cookies.signed[:random_username].blank?
      cookies.signed[:random_username] = {
        value: Haikunator.haikunate(0),
        expires: 20.years.from_now
      }

      flash.now[:notice] = "Welcome! Your username is #{cookies.signed[:random_username]}."
    end
  end

  def current_user
    cookies.signed[:random_username]
  end
  helper_method :current_user
end
