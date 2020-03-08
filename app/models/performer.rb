class Performer < ApplicationRecord
	has_many :songs, dependent: :destroy
	has_many :styles, :through => :performers_styles
	has_and_belongs_to_many :concerts
end
