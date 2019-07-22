class AdminsBackoffice::QuestionsController < AdminsBackofficeController
  before_action :set_question, only: [:edit, :update, :destroy]
  
  def index
    #@questions = Question.all.page(params[:page]).per(5)
    @questions = Question.all
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(permit_params)
    
    if @question.save      
      redirect_to admins_backoffice_questions_path, notice: "Questão criado com sucesso !"
    else      
      render :new
    end
  end
  
  def edit ;end

  def update         
    if @question.update(permit_params)        
      redirect_to admins_backoffice_questions_path, notice: "Questão atualizado com sucesso !"
    else        
      render :edit
    end
  end
  
  def destroy    
    if @question.destroy     
      redirect_to admins_backoffice_questions_path, notice: "Questão excluido com sucesso !"
    else      
      reder :index
    end
  end
  
  
private
 
  def permit_params  
    # Permitindo alguns parametros   
    params.require('question').permit(:id,:description, :subject_id)
  end

  # Setando admin
  def set_question
    @question = Question.find(params[:id])
  end
  
 
end
