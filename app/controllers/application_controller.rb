class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  before_action :set_i18n_locale_from_params

  private

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please login"
    end
  end

  def set_i18n_locale_from_params
    I18n.locale = :en
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end


  def default_url_options
    { locale: I18n.locale }
  end
end
