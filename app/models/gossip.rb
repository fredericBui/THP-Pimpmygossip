class Gossip < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :liked
end
