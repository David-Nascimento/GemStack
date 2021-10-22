class Helper
    def take_screenshot(name_file, folder =     'logs/screenshots/test_screens')
      file = "#{folder}/#{name_file}.png"
      FileUtils.mkdir_p(folder) unless File.exist?(folder)
      Capybara.page.driver.browser.save_screenshot(file)
    end
 end