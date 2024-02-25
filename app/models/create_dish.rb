class CreateDish < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
