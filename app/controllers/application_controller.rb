class ApplicationController < ActionController::Base
  protect_from_forgery

  # helpers/modules are included in views but not in the controllers
  # This is needed for authentication and session tracking
  include SessionsHelper 
end
