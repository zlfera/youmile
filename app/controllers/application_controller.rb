class ApplicationController < ActionController::Base
  fresh_when()
  protect_from_forgery with: :exception
end
