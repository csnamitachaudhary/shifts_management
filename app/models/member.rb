class Member < ApplicationRecord
    belongs_to :team
    has_many :shifts, dependent: :destroy
end
