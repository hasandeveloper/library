class Api::V1::Order < ApplicationRecord
    belongs_to :book
    belongs_to :user
    validates :qty, numericality: { other_than: 0 }
    validates_presence_of :qty, :book_id, :user_id
    validate :check_book_available, on: :create

    def check_book_available
        book = Api::V1::Book.find_by_id(self.book_id)
        if book 
            if book.stock == 0
                errors.add(:qty, "#{book.name} Stock is not available")
            elsif self.qty > book.stock
                errors.add(:qty, "#{book.name} Stock is available only #{book.stock}")
            end
        end
    end
    
end
