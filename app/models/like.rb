class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :pin, counter_cache: true
end
