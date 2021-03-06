class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :kanji_cards, dependent: :destroy
  after_create :create_cards
  validates :jlpt_level, inclusion: { in: [1, 2, 3, 4, 5], message: "%{value} is not a valid JLPT level" }

  private

  def create_cards
    kanji_set = Kanji.where(jlpt: self.jlpt_level)
    kanji_set.each do |kanji|
      KanjiCard.create(
        kanji_id: kanji.id,
        user_id: self.id)
    end
  end
end
