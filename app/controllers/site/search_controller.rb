class Site::SearchController < SiteController
  
  # localhost:3000/site/search => GET
  def questions
    @search_count = Question.search_questions_count(params[:term])
    @questions = Question.search_questions(params[:term], params[:page])
  end
  
  # localhost:3000/site/subject/:subject_id/:subject => GET
  def subject
    @search_subject_count = Question.search_subject_count(params[:subject_id])
    @questions = Question.search_questions_subject(params[:subject_id],params[:page])
  end
  
end
