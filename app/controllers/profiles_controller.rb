class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def edit
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
  end

  def create
  	@profile = current_user.build_profile(profile_params)
  	if @profile.save
      flash[:notice] = "Profile created successfully"
  		redirect_to profile_path(current_user.profile.id)
  	else
  		render :new
  	end
  end

  private

	  def profile_params
	  	params.require(:profile).permit(:name, :instrument, :age, :gender, :bio, :user_id)
	  end

	  def set_profile
	  	@profile = current_user.profile
	  end

end
