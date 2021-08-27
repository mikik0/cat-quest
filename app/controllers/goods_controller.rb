class GoodsController < ApplicationController
  before_action :set_memo
  def create
    @good = current_user.goods.new(memo_id: @memo.id)
    @good.save
  end
  
  def destroy
    @good = Good.find_by(user_id: current_user.id, memo_id: @memo.id)
    @good.destroy
  end
  
  private
  
  def set_memo
    @memo = Memo.find(params[:id])
  end
end
