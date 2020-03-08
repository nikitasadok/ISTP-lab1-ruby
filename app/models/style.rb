class Style < ApplicationRecord
	has_many :performers, :through => :performers_styles
	validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
	validates :bpm, presence: true, numericality: { only_integer: true }

end
