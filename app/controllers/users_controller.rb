class UsersController < ApplicationController
  def show
    @user = current_user
    @character = @user.character
    @current_quest,@past_quest = @user.quest_time_sort
  end


  def edit
  end

  def update
  end
end
