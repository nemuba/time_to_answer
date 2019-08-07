class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :set_subject, only: [:edit, :update, :destroy]
  
  # route: /admins_backoffice/subjects => method: GET
  def index
    #@subjects = Subject.all.page(params[:page]).per(5)
    @subjects = Subject.all
  end

  # route: /admins_backoffice/subjects/new => method: GET
  def new
    @subject = Subject.new
  end
  
  # route: /admins_backoffice/subjects => method: POST
  def create
    @subject = Subject.new(permit_params)
    
    if @subject.save      
      redirect_to admins_backoffice_subjects_path, notice: "Área/Assunto criado com sucesso !"
    else      
      render :new
    end
  end
  
  # route: /admins_backoffice/subjects/:id/edit => method: GET
  def edit ;end

  # route: /admins_backoffice/subjects/:id => method: PATCH
  def update         
    if @subject.update(permit_params)        
      redirect_to admins_backoffice_subjects_path, notice: "Área/Assunto atualizado com sucesso !"
    else        
      render :edit
    end
  end
  
  # route: /admins_backoffice/subjects/:id => method: DELETE
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

  # Setando subject
  def set_subject
    @subject = Subject.find(params[:id])
  end
  
 
end
