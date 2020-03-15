class Festival < ApplicationRecord
	has_many :festival_days, dependent: :destroy
	validates :name, presence:true, length: {minimum:3}, uniqueness: true
	validates :start_date,:end_date, presence:true
	validate :end_date_after_start_date

	def Festival.organizers_ratio
		num_of_distinct_vals = Festival.distinct.count(:organizer_id)
		num_of_records = Festival.count(:all)

		distinct_vals = Festival.distinct.pluck(:organizer_id)

		@ratios = []
		@labels = []

		distinct_vals.each do |val|
			@ratios << (Festival.where("organizer_id = ?", val).count)/num_of_records.to_f
			@labels << Organizer.where("id = ?", val).pluck(:name).first
		end
		Gchart.pie_3d(:title => "Organizers ratio", :data => @ratios, :legend => @labels, :size => "800x350", 
			:bg => {:color => '76A4FB', :type => 'gradient'})
	end
	
	
	private

  def end_date_after_start_date
	return if end_date.blank? || start_date.blank?
	

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
	end
end