require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

browser = ENV["BROWSER"]

case browser
when "firefox"
    @driver = :selenium
when "chrome"
    @driver = :selenium_chrome
when "headless"
    Capybara.register_driver :selenium_chrome_headless do |app|
        Capybara::Selenium::Driver.load_selenium
        browser_optiosn = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
            opts.args << "--headless"
            opts.args << "--disable-gpu"
            opts.args << "--no-sandbox"
            opts.args << "--disable-site-isolation-trials"
            opts.args << "--disable-dev-shm-usage"
        end
        Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_optiosn)
    end

    @driver = :selenium_chrome_headless
else
    @driver = :selenium_chrome
end

Capybara.configure do |config|
    config.default_driver = @driver
    config.default_max_wait_time = 5
end