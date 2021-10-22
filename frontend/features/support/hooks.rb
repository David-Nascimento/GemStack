require "report_builder"
require_relative 'helper.rb'

Before do
  page.current_window.resize_to(1520, 1080)

  @login_page = LoginPage.new
  @side = Sidebar.new
  @prod = ProductPage.new
end

Before("@auth") do
  @login_page.go
  @login_page.with("david@ninjapixel.com", "pwd123")
end

After do |scenario|
  @helper = Helper.new
  @nome = scenario.name.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
    @helper.take_screenshot(@nome, 'logs/screenshots/test_failed') if   scenario.failed?
      unless @helper.take_screenshot(@nome, 'logs/screenshots/test_passed')
    end

end
    
at_exit do
  ReportBuilder.configure do |config|
    config.report_title = "Ninja Pixel"
    config.input_path = "logs/report.json"
    config.report_path = "logs/report"
    config.report_types = [:html]
    config.color = "indigo"
  end
  ReportBuilder.build_report
end