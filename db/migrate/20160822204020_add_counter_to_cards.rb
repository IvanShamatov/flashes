class AddCounterToCards < ActiveRecord::Migration
  def change
    add_column :cards, :counter,        :integer, default: 1
  end
end
