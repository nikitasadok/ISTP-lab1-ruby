class Performer < ApplicationRecord
	has_many :songs, dependent: :destroy
	has_many :styles, :through => :performers_styles
	has_many :concerts, :through => :concerts_performers 
	validates :name, presence: true, uniqueness: true, length: {minimum:2}
end
