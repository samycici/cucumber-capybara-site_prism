require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

Before do |feature|
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
  Capybara.configure do |config|
    config.default_driver = :chrome
    config.app_host = "http://d.busca.estacio.rj.br/"
  end
end

Before do |scenario|
  puts "Starting scenario: #{scenario.title}"
end

After do |scenario|
  if scenario.failed?
    subject = "[Project X] #{scenario.exception.message}"
  end
end
