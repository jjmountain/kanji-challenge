class AddJouyouToKanjis < ActiveRecord::Migration[5.2]
  def change
    add_column :kanjis, :jouyou, :integer
    add_column :kanjis, :traditional, :string
    add_column :kanjis, :rtk, :integer
  end
end
