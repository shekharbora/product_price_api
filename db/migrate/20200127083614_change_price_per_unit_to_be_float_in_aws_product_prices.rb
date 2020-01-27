class ChangePricePerUnitToBeFloatInAwsProductPrices < ActiveRecord::Migration[5.2]
  def change
  	  change_column :aws_product_prices, :price_per_unit, :float
  end
end
