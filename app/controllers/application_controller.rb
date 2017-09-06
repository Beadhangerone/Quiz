class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def debug(model, var)
    puts "---DEBUG---"
    puts "#{controller_name}##{action_name} #{model}:"
    puts var.inspect
    puts "-----------"
  end
  
end
