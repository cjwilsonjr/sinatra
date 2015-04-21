class Entry < ActiveRecord::Base
  has_many :labelings
  has_many :tags, through :labelings
  belongs_to :author, class_name: "User"
end
