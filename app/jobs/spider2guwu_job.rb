class Spider2guwuJob < ApplicationJob
  queue_as :default

  def perform(name)#(*args)
    # Do something later
    p name
  end
end
