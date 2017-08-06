# frozen_string_literal: true

require 'mechanize'
task :ss do
  agent = Mechanize.new
  login_page = agent.get 'https://www.miaoss3.top/login.php'
  login_form = login_page.forms[0]
  username_field = login_form.field_with(name: 'email')
  username_field.value = 'zlfera@msn.com'
  password_field = login_form.field_with(name: 'pass')
  password_field.value = '123456z'
  agent.submit login_form
  # tmp_cookie = agent.cookie_jar
  # agent.cookie_jar = tmp_cookie
  # agent.get('https://www.miaoss3.top/my/panel.php?page=1')
  agent.get('https://www.miaoss3.top/my/api.php?cmd=gift500mb')
end
