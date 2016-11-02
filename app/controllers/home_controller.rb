class HomeController < ApplicationController
  def index
    expires_in 10.hours
    respond_to do |format|
      format.html
    end
  end
end
