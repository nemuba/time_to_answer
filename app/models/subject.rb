class Subject < ApplicationRecord
  # validation => presence: true
  validates :description, presence: :true

  # Association => Has_Many
  # @subject.questions
  has_many :questions
end
