require 'capybara/cucumber'
require 'selenium-webdriver'

Before do |feature|
  Capybara.configure do |config|
    config.default_driver = :selenium
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
