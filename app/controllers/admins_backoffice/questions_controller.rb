class AdminsBackoffice::QuestionsController < AdminsBackofficeController
  before_action :set_question, only: [:edit, :update, :destroy]
  
  # route: /admins_backoffice/questions => method: GET
  def index
    #@questions = Question.includes(:subject).page(params[:page]).per(5)
    @questions = Question.includes(:subject)
  end

  # route: /admins_backoffice/questions/new => method: GET
  def new    
    @question = Question.new
  end
  
  # route: /admins_backoffice/questions => method: POST
  def create
    @question = Question.new(permit_params)
    
    if @question.save      
      redirect_to admins_backoffice_questions_path, notice: "Pergunta criada com sucesso !"
    else      
      render :new
    end
  end
  
  # route: /admins_backoffice/questions/:id/edit => method: GET
  def edit ;end

  # route: /admins_backoffice/questions/:id => method: PATCH
  def update         
    if @question.update(permit_params)        
      redirect_to admins_backoffice_questions_path, notice: "Pergunta atualizada com sucesso !"
    else        
      render :edit
    end
  end
  
  # route: /admins_backoffice/questions/:id => method: DELETE
  def destroy    
    if @question.destroy     
      redirect_to admins_backoffice_questions_path, notice: "Pergunta excluida com sucesso !"
    else      
      reder :index
    end
  end
  
  
private
 
  def permit_params  
    # Permitindo alguns parametros   
    params.require(:question).permit(:id,:description, :subject_id, :answers_attributes => [:id,:description, :correct, :_destroy])
  end

  # Setando question
  def set_question
    @question = Question.find(params[:id])
  end
  
 
end
