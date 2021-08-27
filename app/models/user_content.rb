class UserContent < ApplicationRecord
  belongs_to :user
  belongs_to :content

  # 動画時間を猫缶に換算
  def nekokan
    if self.video_time < 60 * 60 * 2
      3
    elsif self.video_time < 60 * 60 * 5
      7
    else
      10
    end
  end
end
