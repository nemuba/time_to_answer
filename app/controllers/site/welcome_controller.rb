class Site::WelcomeController < SiteController
  
  # route: /site/welcome/index => GET or root_path localhost:3000/
  def index
    @questions = Question.last_questions(params[:page])
  end
end
