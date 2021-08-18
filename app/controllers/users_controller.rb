class UsersController < ApplicationController
  def show
    @quests = Quest.all
  end

  def edit
  end

  def update
  end
end
