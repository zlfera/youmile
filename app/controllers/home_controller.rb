class HomeController < ApplicationController
  def index
    #expires_in 12.hours
    fresh_when(etag: 'zeng ing fa', public: true)
    #system("rails first")
    #respond_to do |format|
      #format.html
    #end
  end
  def grain_index
    @gg = Grain.all
  end
end
