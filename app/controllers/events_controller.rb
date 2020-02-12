class EventsController < ApplicationController
  before_action :login_if_not_logged

  def new
    user = current_user
    @event = user.events.new
  end

  def index
    @events = Event.all
  end

  def show
    @user = User.find(params[:user_id])
    @event = Event.find(params[:id])
  end

  def create
    user = current_user
    @event = user.events.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :date, :location)
  end
end
