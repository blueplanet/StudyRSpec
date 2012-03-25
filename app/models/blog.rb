class Blog < ActiveRecord::Base
  validates_presence_of :name
  has_many :entries
end
