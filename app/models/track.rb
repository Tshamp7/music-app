class Track < ApplicationRecord

    before_action :authenticate_user!

    validates :title, presence: true
    validates :track_number, presence: true

    belongs_to :album
    has_one :band, through: :album
end