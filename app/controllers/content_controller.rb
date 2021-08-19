class ContentController < ApplicationController
  before_action :set_content, only: %i[show]

  def index
    @quests = Quest.all
    @contents = Content.all
  end

  def show
    @quests = Quest.all
    @contents = Content.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:quest_id, :youtube_url, :title)
    end
end
