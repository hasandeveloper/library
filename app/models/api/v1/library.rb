class Api::V1::Library < ApplicationRecord
    has_many :books, dependent: :delete_all
    validates_presence_of :name
end
