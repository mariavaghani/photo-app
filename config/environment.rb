# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :authentication => :plain,
    :user_name => ENV["SENDGRID_USER_NAME"],
    :password => ENV['SENDGRID_PASSWORD'],
    :domain => 'heroku.com',
    :enable_starttls_auto => true
}