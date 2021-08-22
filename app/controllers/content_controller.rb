class ContentController < ApplicationController
  before_action :set_content, only: %i[show]

  def index
    @quests = Quest.all
  end

  def show
  end

  def create
    @contents = Content.all
    @content = Content.new(content_params)
    @content.user_id = current_user.id
    if @content.save
    else
      render :new
    end
  end

  def destroy
    @contents = Content.all
    @content = Content.find(params[:id])
    @content.destroy
  end

  def edit
   @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to request.referer
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:quest_id, :youtube_url)
    end
end
