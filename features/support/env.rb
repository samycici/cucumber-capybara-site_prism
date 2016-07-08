require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'yaml'
require 'capybara/poltergeist'

@@browser = ENV['BROWSER']

Capybara.register_driver :selenium do |app|
  if @@browser.eql?('chrome')
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  elsif @@browser.eql?('firefox')
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  elsif @@browser.eql?('poltergeist')
    options = { js_errors: false }
    Capybara::Poltergeist::Driver.new(app, options)
  end
end

Before do |feature|
  ambiente = ENV['AMBIENTE']
  $config = YAML.load_file(File.dirname(__FILE__) + "/config/#{ambiente}.yaml")
  Capybara.configure do |config|
    config.default_driver = :selenium
  end
  Capybara.default_max_wait_time = 10
end

After do |scenario|
  if scenario.failed?
    diretorio = 'screenshots'
    arquivo = "#{diretorio}/#{scenario.name}.png"
    Dir.mkdir(diretorio) unless File.exist?(diretorio)
    if !@@browser.eql?('poltergeist')
      Capybara.page.save_screenshot(arquivo)
    else
      Capybara.page.driver.browser.save_screenshot(arquivo)
    end
  end
  unless @@browser.eql?('poltergeist')
    Capybara.current_session.driver.quit
  end
end
