class Kanji < ApplicationRecord
  has_many :kanji_cards
  validates :character, uniqueness: true
end
