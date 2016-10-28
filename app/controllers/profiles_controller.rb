class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
  	if @profile.update(profile_params)
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
  		redirect_to profile_path(current_user.profile.id)
  	else 
  		render :new
  	end
  end

  private

	  def profile_params
	  	params.require(:profile).permit(:instrument, :age, :gender, :bio, :user_id)
	  end

	  def set_profile
	  	@profile = current_user.profile
	  end

end
