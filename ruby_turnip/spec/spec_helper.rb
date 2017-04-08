require 'turnip'
require 'turnip/rspec'
require 'selenium-webdriver'

Dir.glob("spec/steps/**/*steps.rb") { |f| load f, true }

RSpec.configure do |config|
  config.before(:each) {
    # exec browser
    @driver = Selenium::WebDriver.for :chrome, :switches => %w[--disable-notifications]
  }

  config.after(:each) {
    # close browser
    @driver.quit
  }
end
