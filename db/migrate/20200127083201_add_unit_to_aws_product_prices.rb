class AddUnitToAwsProductPrices < ActiveRecord::Migration[5.2]
  def change
  	add_column :aws_product_prices, :unit, :string
  end
end
