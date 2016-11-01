class HomeController < ApplicationController
  etag {1}
  def index
    respond_to do |format|
      format.html
    end
  end
end
