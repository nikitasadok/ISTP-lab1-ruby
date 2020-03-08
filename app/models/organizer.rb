class Organizer < ApplicationRecord
	has_many :festivals, dependent: :destroy
	validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
end
