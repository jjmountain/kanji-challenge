class CreateKanjiCards < ActiveRecord::Migration[5.2]
  def change
    create_table :kanji_cards do |t|
      t.float :easiness_factor
      t.integer :repetition
      t.integer :interval
      t.references :user, foreign_key: true
      t.references :kanji, foreign_key: true

      t.timestamps
    end
  end
end
