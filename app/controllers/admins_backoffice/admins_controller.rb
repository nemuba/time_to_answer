class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  before_action :verify_password, only: [:update]

  # route: /admins_backoffice/admins => method: GET	
  def index
    #@admins = Admin.all.page(params[:page]).per(5)
    @admins = Admin.all
  end

  # route: /admins_backoffice/admins/new => method: GET	
  def new
    @admin = Admin.new
  end
  
  # route: /admins_backoffice/admins => method: POST
  def create
    @admin = Admin.new(permit_params)
    
    if @admin.save      
      redirect_to admins_backoffice_admins_path, notice: "Criado com sucesso !"
    else      
      render :new
    end
  end
  
  # route: /admins_backoffice/admins/:id/edit => method: GET
  def edit ;end

  # route: /admins_backoffice/admins/:id => method: PATCH
  def update         
    if @admin.update(permit_params) 
      AdminMailer.update_email(current_admin, @admin).deliver_now       
      redirect_to admins_backoffice_admins_path, notice: "Administrador atualizado com sucesso !"
    else        
      render :edit
    end
  end
  
  # route: /admins_backoffice/admins/:id => method: DELETE	
  def destroy    
    if @admin.destroy     
      redirect_to admins_backoffice_admins_path, notice: "Administrador excluido com sucesso !"
    else      
      reder :index
    end
  end
  
  
private
 
  def verify_password
    # Permitindo so o parametro :email se o campo senha e confirmação estiverem em branco !
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end     
  end


  def permit_params  
    # Permitindo alguns parametros   
    params.require('admin').permit(:id,:email, :password, :password_confirmation)
  end

  # Setando admin
  def set_admin
    @admin = Admin.find(params[:id])
  end
  
 
end
