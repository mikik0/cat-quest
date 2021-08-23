class UserQuestsController < ApplicationController
  def create
    @quest = Quest.find(params[:quest_id])
    current_user.user_quests.create!(quest_id: params[:quest_id])
    redirect_to root_path
  end

  def destroy
    @quest = Quest.find(params[:quest_id])
    current_user.user_quests.find_by(quest_id: params[:quest_id]).destroy!
    redirect_to root_path
  end
end
