class User < ApplicationRecord
    acts_as_paranoid
    has_one :address
    accepts_nested_attributes_for :address
    validates :name, presence: true, length: { minimum: 4 }
end
