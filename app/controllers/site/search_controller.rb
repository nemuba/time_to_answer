class Site::SearchController < SiteController
  
  # route: /site/search => GET
  def questions
    @search_count = Question.search_questions_count(params[:term])
    @questions = Question.search_questions(params[:term], params[:page])
  end
  
  # route: /site/subject/:subject_id/:subject => GET
  def subject    
    @questions = Question.search_questions_subject(params[:subject_id],params[:page])
  end
  
end
