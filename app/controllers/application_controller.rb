class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    user_path( current_user )
  end

  helper_method :mailbox

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  protected
end
