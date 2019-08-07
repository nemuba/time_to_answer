class Answer < ApplicationRecord
  # Association => Belongs_To
  # @answer.question
  belongs_to :question
end
