class EventsController < ApplicationController
  before_action :login_if_not_logged

  def new
    user = current_user
    @event = user.events.new
  end

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcom
  end

  def show
    @user = User.find(params[:user_id])
    @other_users = User.where.not(id: params[:user_id])
    @event = Event.find(params[:id])
  end

  def create
    user = current_user
    @event = user.events.build(event_params)
    if @event.save
      redirect_to user_event_path(user, @event)
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :date, :location)
  end
end
