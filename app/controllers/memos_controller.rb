class MemosController < ApplicationController
    def create
        @content = Content.find(params[:content_id])
        @quest = Quest.find(params[:myquest_id])
        @memo = current_user.memos.new(memo_params)
        @memo.content_id = @content.id
    end

    def destroy
        @quest = Quest.find(params[:myquest_id])
        @memo = Memo.find(params[:id])
        @content = @memo.content
        @memo.destroy
    end

    private
    def memo_params
      params.require(:memo).permit(
        :text,
        :time
      )
    end
end
