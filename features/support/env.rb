require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'yaml'
require 'capybara/poltergeist'

$ambiente = ENV['AMBIENTE']
$browser = ENV['BROWSER']

Capybara.register_driver :selenium do |app|
  if $browser == 'chrome'
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  elsif $browser == 'firefox'
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  elsif $browser == 'poltergeist'
    options = {js_errors: false}
    Capybara::Poltergeist::Driver.new(app, options)
  end
end

Before do |feature|
  $config = YAML.load_file(File.dirname(__FILE__) + '/config/%s.yaml' % [$ambiente])
  Capybara.configure do |config|
      config.default_driver = :selenium
  end
  Capybara.default_max_wait_time = 10
end

After do |scenario|
  if scenario.failed?
    diretorio = 'screenshots'
    Dir.mkdir(diretorio) unless File.exists?(diretorio)
    if $browser == 'poltergeist'
      Capybara.page.save_screenshot("screenshots/#{scenario.name}.png")
    else
      Capybara.page.driver.browser.save_screenshot("screenshots/#{scenario.name}.png")
    end
  end
  if $browser != 'poltergeist'
    Capybara.current_session.driver.quit
  end
end
