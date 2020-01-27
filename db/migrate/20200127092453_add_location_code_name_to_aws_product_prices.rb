class AddLocationCodeNameToAwsProductPrices < ActiveRecord::Migration[5.2]
  def change
  	add_column :aws_product_prices, :location_code_name, :string
  end
end
