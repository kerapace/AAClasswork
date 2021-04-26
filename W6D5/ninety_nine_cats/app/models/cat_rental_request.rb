class CatRentalRequest < ApplicationRecord
    validates :status, inclusion: {in: %w(Pending Approved Denied), message: "status must be 'Pending', 'Approved', or 'Denied'"}
    validate :no_overlapping_rentals

    belongs_to :cat,
        foreign_key: :cat_id,
        class_name: :Cat

    has_many :same_requests,
        through: :cat,
        source: :requests

    # def no_overlapping_rentals
    #     requests = self.sibling_requests
    #     if requests.any? {|req| [self.start_date,self.end_date].any?{|date| }}
    # end

    # def sibling_requests
    #     self.same_requests.
    # end
end
