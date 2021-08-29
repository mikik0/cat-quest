class UsersController < ApplicationController
  before_action :authenticate_user!  

  def show
    @user = current_user
    @character = @user.character
    @current_quest,@past_quest = @user.quest_time_sort
  end

  def edit
  end

  def update
  end

  # myquest一覧画面
  def index
    @quests = current_user.quests
  end

  private
end
