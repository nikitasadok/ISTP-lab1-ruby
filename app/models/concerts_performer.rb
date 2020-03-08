class ConcertsPerformer < ApplicationRecord
    belongs_to :concert
    belongs_to :performer
end