class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile, only: [:show, :edit, :update]

  def show
    @links = {header: 'Profile',
      nav_link: current_user.teacher ? {display: 'To Students', url: '/students'} : 
      {display: 'To Lessons', url: "/students/#{current_user.id}/lessons"} }
    @user = @profile.user
  end

  def edit
    @links = {header: 'Edit Profile', nav_link: {display: 'To Profile', url: "/profiles/#{@profile.id}"} }
  end

  def update
  	if @profile.update(profile_params)
      flash[:notice] = "Profile updated successfully"
  		redirect_to profile_path(current_user.profile.id)
  	else
  		render :edit
  	end
  end

  def new
  	@profile = Profile.new
    @links = {header: 'New Profile'}
  end

  def create
  	@profile = current_user.build_profile(profile_params)
  	if @profile.save
      flash[:notice] = "Profile created successfully"
  		redirect_to profile_path(current_user.profile.id)
  	else
      flash[:warn] = "Profile not created"
  		render :new
  	end
  end

  private

	  def profile_params
	  	params.require(:profile).permit(:name, :instrument, :birthday, :gender, :bio, :user_id)
	  end

	  def set_profile
	  	@profile = Profile.find(params[:id])
	  end

end
