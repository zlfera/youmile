class HomeController < ApplicationController
  def index
    #expires_in 12.hours
    #fresh_when(Time.new.day)
    respond_to do |format|
      format.html
    end
  end
end
