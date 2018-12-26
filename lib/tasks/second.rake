# frozen_string_literal: true

task second: :environment do
  if Grain.all.size > 9000
    Grain.first(100).each do |i|
      i.delete
    end
  end
end
