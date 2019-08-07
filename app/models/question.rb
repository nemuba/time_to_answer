class Question < ApplicationRecord
  validates :description, presence: :true
  belongs_to :subject, counter_cache: true, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  paginates_per 5

  scope :search_questions, -> (term, page){
    includes(:answers)
    .where("lower(description) LIKE ?", "%#{term.downcase}%")
    .page(page)
  }

  scope :search_questions_subject, -> (subject_id, page){
     includes(:answers)
     .where(subject_id: subject_id)
     .page(page)
  }
  scope :search_subject_count, -> (subject_id) { 
    includes(:answers)
    .where(subject_id: subject_id)
    .count
  }  

  scope :search_questions_count, -> (term){
    includes(:answers)
    .where("lower(description) LIKE ?", "%#{term.downcase}%")
    .count
  }

  scope :last_questions, -> (page){
    includes(:answers)
    .order('created_at asc')
    .page(page)
  }
  
end
