class ActivitiesController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :create, :destroy]

  respond_to :html, :json, :xml

  def index
    if signed_in?
      @activities = current_user.activities.paginate(page: params[:page])
      @activity = current_user.activities.build
      @activity.build_address
    end
    @all_activities = Activity.paginate(page: params[:page], per_page: 30)

    respond_with @activities
  end

  def create
    @activity = current_user.activities.build(params[:activity])
    if @activity.save
      flash[:success] = "Activity created!"
      redirect_to activities_path
    else
      if signed_in?
        @activities = current_user.activities.paginate(page: params[:page])
      end
      @all_activities = Activity.paginate(page: params[:page], per_page: 30)
      render 'index'
    end
  end

  def destroy
    @activity.destroy
    redirect_to root_url
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end
end