class User < ApplicationRecord
has_many :events, foreign_key: 'creator_id'

  validates :name, presence: true
end
