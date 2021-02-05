class Max < ApplicationRecord
  puts 'Exceeded Code Limit. Delete others or upgrade to pro' if Code.count >= 4

  HardWorker.perform_at(168.hours.from_now)
end
