class Gossip < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :liked
  has_many :comments, dependent: :delete_all
end
