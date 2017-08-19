# frozen_string_literal: true

require 'mechanize'
task :ss do
  agent = Mechanize.new
  agent.user_agent = 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko'
  login_page = agent.get 'https://www.miaoss3.com/login.php'
  login_form = login_page.forms[0]
  username_field = login_form.field_with(name: 'email')
  username_field.value = 'zlfera@msn.com'
  password_field = login_form.field_with(name: 'pass')
  password_field.value = '123456z'
  agent.submit login_form
  # tmp_cookie = agent.cookie_jar
  # agent.cookie_jar = tmp_cookie
  # agent.get('https://www.miaoss3.top/my/panel.php?page=1')
  agent.get('https://www.miaoss3.com/my/api.php?cmd=gift500mb')
end
