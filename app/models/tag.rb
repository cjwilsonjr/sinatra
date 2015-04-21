class Tag < ActiveRecord::Base
  has_many :labelings
  has_many :entries, through :labelings
end
