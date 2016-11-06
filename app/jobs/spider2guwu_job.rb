class Spider2guwuJob < ApplicationJob
  queue_as :default

  def perform()
    # Do something later
    puts '123'
  end
end
