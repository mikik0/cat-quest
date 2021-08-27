class UserContentsController < ApplicationController
    def create
      @content = Content.find(params[:content_id])
      @quest = Quest.find(params[:myquest_id])
      @user_contents = UserContent.new(user_contents_params)
      @user_contents.user_id = current_user.id
      @user_contents.content_id = params[:content_id]
      @user_contents.is_finished = true
      @user_contents.save
      current_user.get_nekokan(@user_contents.nekokan)
      if @quest.finished?(current_user)
        current_user.get_nekokan(@quest.total_nekokan(current_user))
      end
      flash.now[:notice] = "猫缶を取得しました！"
    end

    def destroy
      @user_content = UserContent.find(params[:id])
      @user_content.destroy
    end

    private
    def user_contents_params
      params.require(:user_contents).permit(
        :video_time
      )
    end
end
