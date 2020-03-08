class Festival < ApplicationRecord
	has_many :festival_days, dependent: :destroy
	validates :name, presence:true, length: {minimum:3}, uniqueness: true
	validates :start_date,:end_date, presence:true
	validate :end_date_after_start_date

	private

  def end_date_after_start_date
	return if end_date.blank? || start_date.blank?
	

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
	end
end