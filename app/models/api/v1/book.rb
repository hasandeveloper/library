class Api::V1::Book < ApplicationRecord
    belongs_to :library
    has_many :orders
    validates_presence_of :name, :description
end
