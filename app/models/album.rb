class Album < ApplicationRecord

    validates :title, presence: true
    validates :year, presence: true
    validates :album_type, inclusion: { in: ["Live", "Studio" ]}
    validates :album_type, presence: true
    validates :band_id, presence: true

    belongs_to :band
    has_many :tracks, dependent: :destroy

end