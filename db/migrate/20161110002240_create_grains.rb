class CreateGrains < ActiveRecord::Migration[5.0]
  def change
    create_table :grains do |t|
      t.string :market_name
      t.string :mark_number
      t.string :year
      t.string :type
      t.string :grade
      t.string :trade_amount
      t.string :starting_price
      t.string :latest_price
      t.string :address
      t.string :status

      t.timestamps
    end
  end
end
