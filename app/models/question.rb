class Question < ApplicationRecord
  validates :description, presence: :true
  belongs_to :subject
end
