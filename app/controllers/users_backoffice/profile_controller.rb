class UsersBackoffice::ProfileController < UsersBackofficeController  
  before_action :set_user, only: [:update]
  before_action :verify_password, only: [:update]
  
  # localhost:3000/users_backoffice/profile => GET
  def edit
    @user = User.find(current_user.id)
    @user.build_user_profile if @user.user_profile.blank?
  end

  # localhost:3000/users_backoffice/profile/:id => PATCH 
  def update    
    if @user.update_attributes(permit_params)
      bypass_sign_in(@user) 
      unless permit_params[:user_profile_attributes][:avatar]              
        redirect_to users_backoffice_profile_path, notice: "Usuário atualizado com sucesso !"
      end
    else        
      render :edit
    end
  end

  private

  # verificando senha
  def verify_password
     if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end  
  end
  
  # permitindo parametros
  def permit_params
    params.require(:user).permit(:id, :first_name, 
                                 :last_name, :email, 
                                 :password, :password_confirmation,
                                 :user_profile_attributes => [:id, :address, :gender, :birthdate, :avatar])
  end
  
  # setando usuário
  def set_user
    @user = User.find(params[:id])
  end
end
