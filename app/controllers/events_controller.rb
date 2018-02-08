class EventsController < ApplicationController
  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(event_params)
  	@event.creator = current_user
  	if @event.save
      flash[:success] = "Votre événement a bien été créé !"    
  		redirect_to @event
  	else render 'new'
  	end
  end

  def index
  	@events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def suscribe
    @event = Event.find(params[:id])
    if 
    @event.attendees.include? current_user
    flash[:error] = "Vous participez déjà à l'événement !" 
    redirect_to @event
    else
    @event.attendees << current_user
    flash[:success] = "Vous participez à l'événement !" 
    redirect_to @event
    end
  end

  def adduser  
    @user = User.find(params[:id])
    @event = Event.find(params[:test])
 #   if 
 #   @event.attendees.include? @user
 #   flash[:danger] = "#{@user.name} participe déjà à l'événement !" 
 #   redirect_to @event
 #   else
    @event.attendees << @user
    flash[:success] = "#{@user.name} est ajouté à l'événement ! !" 
    redirect_to @event
 #   end
  end

	private
  	def event_params
      params.permit(:name, :description, :date, :place)
  	end
end
