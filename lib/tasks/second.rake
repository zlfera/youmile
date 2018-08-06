# frozen_string_literal: true

task second: :environment do
  if Grain.all.size > 9500
    Grain.first(200).each do |i|
      i.delete
    end
  end
end
