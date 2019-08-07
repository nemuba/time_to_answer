class Site::AnswerController < SiteController
  
  # localhost:3000/site/answer => POST
  def question
    @answer = Answer.find(params[:answer_id])       
  end
end
