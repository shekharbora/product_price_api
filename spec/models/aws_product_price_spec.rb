require 'rails_helper'

RSpec.describe AwsProductPrice, type: :model do
  
  before do
    @date1 = Date.parse("2020-01-01")
    @date2 = Date.parse("2020-01-02")   
    AwsProductPrice.create([{location_code_name: "us-east-1", effective_date: @date1}, {location_code_name: "us-east-1",effective_date: @date2}])
  end

  describe AwsProductPrice, '#filter_by_region_and_date' do
    it 'returns price detail for given region' do
    	prices_detail = AwsProductPrice.where(location_code_name: "us-east-1")
    	prices_detail.count.should be >= 1
    end
    
    it 'returns price detail for given region and date' do
     	prices_detail = AwsProductPrice.where(location_code_name: "us-east-1",effective_date: "2019-12-01")
    end

    it 'returns price detail not avalable' do
     	prices_detail = AwsProductPrice.where(location_code_name: "us-east-5",effective_date: "2019-12-01")
     	prices_detail.count.should eq(0)
    end

  end

end
