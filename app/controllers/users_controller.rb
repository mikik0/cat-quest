class UsersController < ApplicationController
  before_action :authenticate_user!  

  def show
    @quests = Quest.all
  end

  def edit
  end

  def update
  end
end
