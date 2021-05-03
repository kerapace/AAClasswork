class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include ActionView::Helpers::DateHelper

  def created_timestamp
    time_ago_in_words(self.created_at)
  end

  def updated_timestamp
    time_ago_in_words(self.updated_at)
  end
end
