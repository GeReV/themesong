class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!

  before_action :set_identity

  after_action :sign_in_and_redirect, except: :failure

  def facebook
    @kind = 'Facebook'
  end

  def google_oauth2
    @kind = 'Google'
  end

  def failure
    redirect_to root_path
  end

  private

  def set_identity
    @identity = UserIdentity.from_omniauth(request.env["omniauth.auth"])
  end

  def sign_in_and_redirect
    if @identity.persisted?
      sign_in_and_redirect @identity.user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: @kind) if is_navigational_format?
    end
  end
end
