class UserContentsController < ApplicationController
    def create
      @content = Content.find(params[:content_id])
      @quest = Quest.find(params[:myquest_id])
      @user_contents = UserContent.new(user_content_params)
      @user_contents.user_id = current_user.id
      @user_contents.content_id = params[:content_id]
      @user_contents.is_finished = true
      @user_contents.save
      redirect_to myquest_content_path(@quest, @content)
    end

    def destroy
      @user_content = UserContent.find(params[:id])
      @user_content.destroy
      redirect_to myquest_content_path
    end

    private
    def user_contents_params
      params.require(:user_contents).permit(
        :video_time
      )
    end
end
