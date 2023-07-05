class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[top about]
  before_action :authenticate_admin!, if: :admin_url

  protected

  def admin_url
    request.fullpath.include?("/admin")
  end

end
