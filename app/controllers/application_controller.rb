class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  etag {Time.new.day}
end
