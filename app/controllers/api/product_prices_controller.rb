class Api::ProductPricesController < ApplicationController

  def get_price
    @prices = AwsProductPrice.filter_by_region_and_date(params[:codename], params[:date])
    render json: @prices
  end

end
