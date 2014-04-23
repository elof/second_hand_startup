class EventsController < ApplicationController

  def index
    @events = Event.all

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @events }
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to root_path
    else
      flash[:error] = "Error Error Error Error"
      render :new
    end
  end

  def create_rsvp
    Rsvp.create(:user_id => current_user.id, :event_id => params[:event_id])
    data = {}
    render :json  => data
  end

  def show 
    if current_user 
      @event = Event.find(params[:id])
      @comments = @event.comment_threads.order('created_at desc')
      @new_comment = Comment.build_from(@event, current_user, "")
    else 
      redirect_to signin_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to root_path
    else
      flash[:error] = "Error Error Error Error"
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.delete
    redirect_to root_path
  end
end
