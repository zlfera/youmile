class HomeController < ApplicationController
  def index
    #expires_in 12.hours
    fresh_when(etag: Time.new.day, public: true)
    #system("rails first")
    #respond_to do |format|
      #format.html
    #end
  end
  def grain_index
    #system("rails first")
    @gg = Grain.all
    @gg = @gg.order(created_at: :desc)
  end
end
