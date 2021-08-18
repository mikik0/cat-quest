class ContentController < ApplicationController
  def index
    @quests = Quest.all
  end
end
