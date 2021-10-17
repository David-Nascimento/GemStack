Before do
  page.current_window.resize_to(1520, 1080)
  @login_page = LoginPage.new
  @side = Sidebar.new
  @prod = ProductPage.new
end

Before('@auth') do
  @login_page.go
  @login_page.with("david@ninjapixel.com", "pwd123")
end
