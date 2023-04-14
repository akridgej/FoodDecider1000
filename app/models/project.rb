class Project < ApplicationRecord
    validates :restaurant, presence: true
    validates :foodCombo, presence: true
    validates :rating, presence: true
end
