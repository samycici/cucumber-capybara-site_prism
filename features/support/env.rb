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
  Capybara.default_max_wait_time = 5
end

After do |scenario|
  if scenario.failed?
    diretorio = 'screenshots'
    Dir.mkdir(diretorio) unless File.exists?(diretorio)
    Capybara.page.driver.browser.save_screenshot("screenshots/#{scenario.name}.png")
  end
  Capybara.current_session.driver.quit
end
