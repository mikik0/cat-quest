class Tag < ApplicationRecord
	has_many :tag_contents, dependent: :destroy
	has_many :contents, through: :tag_contents
end
