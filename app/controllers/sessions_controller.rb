class SessionsController < ApplicationController
  
  def create
    if user = User.find_by(name: params[:session][:name].downcase)
 #   flash.now[:notice] = "Vous êtes connecté !"  
    log_in user
    redirect_to user
    else
    flash.now[:danger] = "Cet utilisateur n'existe pas !"
    render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'Vous êtes bien déconnecté'
    redirect_to root_url
  end


end
