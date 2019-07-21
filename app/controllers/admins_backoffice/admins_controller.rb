class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :set_admin, only: [:edit, :update]
  before_action :verify_password, only: [:update]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(permit_params)
    
    if @admin.save      
      redirect_to admins_backoffice_admins_path, notice: "Criado com sucesso !"
    else      
      render :new
    end
  end
  
  def edit ;end

  def update         
    if @admin.update(permit_params)        
      redirect_to admins_backoffice_admins_path, notice: "Administrador atualizado com sucesso !"
    else        
      render :edit
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
