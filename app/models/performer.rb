class Performer < ApplicationRecord
	has_many :songs
	has_and_belongs_to_many :styles
	has_and_belongs_to_many :concerts
end
