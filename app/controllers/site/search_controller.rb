class Site::SearchController < SiteController
  def questions
    @search_count = Question.search_questions_count(params[:term])
    @questions = Question.search_questions(params[:term], params[:page])
  end
end
