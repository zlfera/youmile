# frozen_string_literal: true

task second: :environment do
  if Grain.all.size > 9000
    Grain.first(1000).each do |i|
      i.delete
    end
  end
end
