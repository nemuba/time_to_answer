class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :set_subject, only: [:edit, :update, :destroy]
  
  def index
    #@subjects = Subject.all.page(params[:page]).per(5)
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end
  
  def create
    @subject = Subject.new(permit_params)
    
    if @subject.save      
      redirect_to admins_backoffice_subjects_path, notice: "Área/Assunto criado com sucesso !"
    else      
      render :new
    end
  end
  
  def edit ;end

  def update         
    if @subject.update(permit_params)        
      redirect_to admins_backoffice_subjects_path, notice: "Área/Assunto atualizado com sucesso !"
    else        
      render :edit
    end
  end
  
  def destroy    
    if @subject.destroy     
      redirect_to admins_backoffice_subjects_path, notice: "Área/Assunto excluido com sucesso !"
    else      
      reder :index
    end
  end
  
  
private
 
  def permit_params  
    # Permitindo alguns parametros   
    params.require('subject').permit(:id,:description)
  end

  # Setando admin
  def set_subject
    @subject = Subject.find(params[:id])
  end
  
 
end
