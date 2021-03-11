class StudyItem < ApplicationRecord
    validates :title, presence: true
    validates :category, presence: true
    validates :description, length: { maximum: 200 }
end
