require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'yaml'

Capybara.register_driver :selenium do |app|
  browser = ENV['BROWSER']
  if browser == 'chrome'
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  elsif browser == 'firefox'
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end
end

Before do |feature|
  ambiente = ENV['AMBIENTE']
  $config = YAML.load_file(File.dirname(__FILE__) + '/config/%s.yaml' % [ambiente])
  Capybara.configure do |config|
      config.default_driver = :selenium
  end
  Capybara.page.driver.browser.manage.window.maximize
end

After do |scenario|
  if scenario.failed?
    Capybara.page.driver.browser.save_screenshot("screenshots/#{scenario.__id__}.png")
  end
  Capybara.current_session.driver.quit
end
