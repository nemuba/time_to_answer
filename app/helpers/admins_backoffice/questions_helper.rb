module AdminsBackoffice::QuestionsHelper
  def list_subjects
    Subject.all.pluck(:description, :id)
  end
  
end
