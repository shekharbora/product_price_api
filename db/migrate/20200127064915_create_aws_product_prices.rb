class CreateAwsProductPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :aws_product_prices do |t|
      t.string :description
      t.string :begin_range
      t.string :end_range
      t.string :price_per_unit
      t.datetime :effective_date

      t.timestamps
    end
  end
end
