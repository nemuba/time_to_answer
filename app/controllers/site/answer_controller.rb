class Site::AnswerController < SiteController
  
  # route: /site/answer => POST
  def question
    @answer = Answer.find(params[:answer_id])       
  end
end
