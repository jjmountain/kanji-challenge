class RenameCore2000ToCoreWords < ActiveRecord::Migration[5.2]
  def change
    rename_table :core2000s, :core_words
  end
end
