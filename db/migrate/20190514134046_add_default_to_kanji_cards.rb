class AddDefaultToKanjiCards < ActiveRecord::Migration[5.2]
  def change
    change_column_default :kanji_cards, :easiness_factor, 2.5
    change_column_default :kanji_cards, :repetition, 0
  end
end
