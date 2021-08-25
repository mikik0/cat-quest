class MemosController < ApplicationController
    def create
        @content = Content.find(params[:content_id])
        @quest = Quest.find(params[:myquest_id])
        @memo = Memo.new(memo_params)
        @memo.user_id = current_user.id
        @memo.content_id = params[:content_id]
        @memo.save
        redirect_to myquest_content_path(@quest, @content)
    end

    def destroy
        @memo = Memo.find(params[:id])
        @memo.destroy
        redirect_to myquest_content_path
    end

    private
    def memo_params
      params.require(:memo).permit(
        :text,
        :time
      )
    end
end
