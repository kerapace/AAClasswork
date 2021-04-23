require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    validates :color, inclusion: {in: %w(brown black orange), message: "invalid color"} 
    validates :sex, inclusion: {in: %w(M F), message: "must be M or F"}
    
    def age
        return distance_of_time_in_words(Date.today,self.birth_date)
    end
end
