class ContentController < ApplicationController
  before_action :set_content

  def index
    @quests = Quest.all
  end

  def show
	  @memo = @content.memos
  end

  def new
    @content = Content.new
  	@memo = Memo.new
  end

  def create
    @memo = Memo.new
    @memo.user_id = current_user.id
    @memo.save
    redirect_to user_quest_content_path
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
