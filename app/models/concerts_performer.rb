class ConcertsPerformer < ApplicationRecord
    belongs_to :concert
    belongs_to :performer
    validate :one_concert_for_performer_per_fest

    
    def one_concert_for_performer_per_fest
        all_perf_concerts = Concert.where("id in (?)", ConcertsPerformer.where("performer_id = ?", performer_id).pluck(:concert_id))

        all_perf_fest_days = FestivalDay.where("id in (?)", all_perf_concerts.pluck(:festival_day_id))

        all_perf_fests = Festival.where("id in (?)", all_perf_fest_days.pluck(:festival_id)).pluck(:name)

        perf_conc = Concert.where("id = ?", concert_id)

        perf_fest_day = FestivalDay.where("id = ?", perf_conc.pluck(:festival_day_id).first)

        perf_fest = Festival.where("id = ?", perf_fest_day.pluck(:festival_id).first).pluck(:name).first

        if (all_perf_fests.include?(perf_fest))
            errors.add(:performer, "Already has a performance booked at this festival")
        end
    end

end