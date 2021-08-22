class MemosController < ApplicationController
  before_action :current_user
  before_action :find_memo, only: [:update, :destroy]

  # あるメモページのメモ一覧のJSONを返す．
  def index
  end

  # メモを作成する．
  def create
    memo = Memo.create!(params.permit(:page_id, :parent_id, :text, :time, :status).merge(user_id: @user.id, account_id: @user.account_id))
  end

  def update
    if @memo.update(params.permit(:text, :time, :status))
    # else
    #  エラー処理
    # end
  end

  def destroy
    @memo.destroy
  end

private
  def find_memo
    @memo = Memo.find(params[:memo_id])
  end
end
