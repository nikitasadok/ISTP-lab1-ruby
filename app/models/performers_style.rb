class PerformersStyle < ApplicationRecord
    belongs_to :performer
    belongs_to :style
    
    validates_uniqueness_of :performer_id, scope: %i[style_id]
        
end