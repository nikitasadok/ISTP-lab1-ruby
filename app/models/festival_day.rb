class FestivalDay < ApplicationRecord
	attr_accessor :start_date, :end_date
	has_many :concerts, dependent: :destroy
	validates :date, presence: true
	validate :date_included_in_festival_dates
	validate :date_is_defined_for_festival

	private 

	def date_included_in_festival_dates
		return if date.blank?

		start_date = Festival.where("id = ?", self.festival_id).pluck(:start_date).first
		end_date = Festival.where("id = ?", self.festival_id).pluck(:end_date).first
	
		unless (start_date..end_date).include?(date)
		   err = "is not between start date, " + start_date.strftime("%a, %d %b %Y") + " and end date, " +
		   end_date.strftime("%a, %d %b %Y")
		  errors.add(:date, err)
		end
	end
	def date_is_defined_for_festival
		dates = FestivalDay.where("festival_id = ?", self.festival_id).pluck(:date)

		dates.each do |d|
			if d.eql?(date)
				errors.add(:date, " is already defined for this festival")
			end
		end
	end
end

