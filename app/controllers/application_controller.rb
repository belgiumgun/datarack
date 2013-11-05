class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_flash_types :error, :record_created, :record_updated, :notice,:update_notices
  protect_from_forgery with: :exception
end
