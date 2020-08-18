class Band < ApplicationRecord

    before_action :authenticate_user!

    validates :name, presence: true

    has_many :albums, dependent: :destroy
    has_many :tracks, through: :albums

end