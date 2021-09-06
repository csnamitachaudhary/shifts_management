class Team < ApplicationRecord
    enum department: { engineering: 0, it: 1,  hr:2}
    has_many :members, dependent: :destroy
end
