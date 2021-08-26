class QuestsController < ApplicationController
  before_action :set_quest, only: %i[ show edit update destroy ]
  before_action :authenticate_owner!, only: %i[ edit update destroy]


  # GET /quests or /quests.json
  def index
    @quests = Quest.all
  end

  # GET /quests/1 or /quests/1.json
  def show
  end

  # GET /quests/new
  def new
    @quest = Quest.new
    @quest.contents.build
  end

  # POST /quests or /quests.json
  def create
    @quest = Quest.create(quest_params)

    respond_to do |format|
      if @quest.save
        #クエストを作成すると同時にそやつ自身もクエストに参加する
        current_user.user_quests.create(
          quest_id: @quest.id,
          is_owner: true
        )

        @quest.contents.each do |content|
          TechTagEvent.create(
            content_id: content.id,
            youtube_url: content.youtube_url
          )
        end
        format.html { redirect_to @quest, notice: "Quest was successfully created." }
        format.json { render :show, status: :created, location: @quest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /quests/1/edit
  def edit
  end

  # PATCH/PUT /quests/1 or /quests/1.json
  def update
    respond_to do |format|
      if @quest.update(quest_params)
        format.html { redirect_to @quest, notice: "Quest was successfully updated." }
        format.json { render :show, status: :ok, location: @quest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quests/1 or /quests/1.json
  def destroy
    @quest.destroy
    respond_to do |format|
      format.html { redirect_to quests_url, notice: "Quest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest
      @quest = Quest.find(params[:id])
    end

    def authenticate_owner!
      unless current_user.owner?(@quest.id)
        redirect_to user_path(current_user)
      end
    end

    # Only allow a list of trusted parameters through.
    def quest_params
      params.require(:quest).permit(
        :title,
        :description,
        :total_video_time,
        :strated_at,
        :finished_at,
        contents_attributes: [:id, :youtube_url, :_destroy]
      )
    end
end
