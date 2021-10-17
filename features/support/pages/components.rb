class Sidebar
    include Capybara::DSL

    def logged_user
        return find('.user .info span').text
    end
end