class FestivalDay < ActiveRecord::Base
	attr_accessor :start_date, :end_date
	has_many :concerts, dependent: :destroy
	validates :date, presence: true
	validate :date_included_in_festival_dates
	validate :date_is_defined_for_festival

	def FestivalDay.festivals_ratio
		num_of_distinct_vals = FestivalDay.distinct.count(:festival_id)
		num_of_records = FestivalDay.count(:all)

		distinct_vals = FestivalDay.distinct.pluck(:festival_id)

		@ratios = []
		@labels = []

		distinct_vals.each do |val|
			@ratios << (FestivalDay.where("festival_id = ?", val).count)/num_of_records.to_f
			@labels << Festival.where("id = ?", val).pluck(:name).first
		end
		Gchart.pie_3d(:title => "Festivals ratio", :data => @ratios, :legend => @labels, :size => "800x350", 
			:bg => {:color => '76A4FB', :type => 'gradient'})
	end


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

