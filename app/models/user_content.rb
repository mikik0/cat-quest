class UserContent < ApplicationRecord
  belongs_to :user
  belongs_to :content
  belongs_to :quest
end
