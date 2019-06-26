class AddAnswerToCore2000 < ActiveRecord::Migration[5.2]
  def change
    add_column :core2000s, :answer, :string
  end
end
