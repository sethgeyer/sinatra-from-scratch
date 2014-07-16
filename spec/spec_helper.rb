require_relative "./../app"
require "capybara/rspec"
ENV["RACK_ENV"] = "test"

Capybara.app = App

database_connection = DatabaseConnection.establish(ENV["RACK_ENV"])

RSpec.configure do |config|
  config.before do
    database_connection.sql("BEGIN")
  end

  config.after do
    database_connection.sql("ROLLBACK")
  end
end


def fill_in_registration_form_and_submit(name)
  visit '/users/new'
  fill_in "Username", with: "#{name}"
  fill_in "Password", with: "#{name.downcase}"
  click_on "Submit"
end

def create_a_fish(name)
  click_on "Fish"
  fill_in "Name", with: "#{name}"
  fill_in "URL", with: "http://en.wikipedia.org/wiki/#{name}"
  click_on "Submit"
end

def user_logs_in(name)
  fill_in "Username", with: "#{name}"
  fill_in "Password", with: "#{name.downcase}"
  click_on "Submit"
end




# def clear_test_dbase
#   @dummy = DatabaseConnection.new(ENV["RACK_ENV"])
#   @dummy.sql("DELETE FROM users WHERE id>0 ")
# end
