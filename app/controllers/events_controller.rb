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

	private
  	def event_params
      params.permit(:name, :description, :date, :place)
  	end
end
