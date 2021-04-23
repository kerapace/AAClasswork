require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    def age
        return distance_of_time_in_words(Date.today,self.birth_date)
    end
end
