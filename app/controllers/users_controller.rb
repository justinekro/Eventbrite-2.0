class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Votre profil a bien été créé ! Bienvenue sur le site qui vous donnera la réponse à la question de l'univers..."

 # On login quand un nouvel user est créé     
 #     log_in @user
      redirect_to @user
    else render 'new'
    end
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else render 'edit'
    end
  end

  private
    def user_params
      params.permit(:name)
    end

end
