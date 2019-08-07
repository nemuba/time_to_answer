class Question < ApplicationRecord
  # validations
  validates :description, presence: :true
  
  # Associations => Belongs_To
  # @question.subject
  # @question.subject.questions_count
  belongs_to :subject, counter_cache: true, inverse_of: :questions
  
  # Association => Has_Many
  # @question.answers
  has_many :answers
  
  # Nested Attributes
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  # Kaminari paginate
  paginates_per 5

  # Scopes

  # Question.search_questions(term,page)
  scope :search_questions, -> (term, page){
    includes(:answers)
    .where("lower(description) LIKE ?", "%#{term.downcase}%")
    .page(page)
  }

  # Question.search_questions_subject(subject_id,page)
  scope :search_questions_subject, -> (subject_id, page){
     includes(:answers)
     .where(subject_id: subject_id)
     .page(page)
  }

  # Question.search_questions_count(term)
  scope :search_questions_count, -> (term){
    includes(:answers)
    .where("lower(description) LIKE ?", "%#{term.downcase}%")
    .count
  }

  # Question.last_questions(page)
  scope :last_questions, -> (page){
    includes(:answers)
    .order('created_at asc')
    .page(page)
  }
  
end
