class Entry < ActiveRecord::Base
  belongs_to :blog

  before_save :fill_posted_on

  def fill_posted_on
    self.posted_on ||= Date.today
  end
end
