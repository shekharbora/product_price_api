require 'rails_helper'

RSpec.describe Api::ProductPricesController, type: :controller do

   before do
    @date1 = Date.parse("2020-01-01")
    @date2 = Date.parse("2020-01-02")   
    AwsProductPrice.create([{location_code_name: "us-east-1", effective_date: @date1}, {location_code_name: "us-east-1",effective_date: @date2}])
  end

  describe 'GET /api/service/amazon_cloud_front/region/:codename' do
    context "location exist" do
      it "should success without date" do
        get :get_price, params: {codename: "us-east-1"}
        expect(response.status).to eq(200)
        json_body = JSON.parse(response.body)
        expect(json_body.count).to eq(2)
      end

      it "should success with date" do
        get :get_price, params: {codename: "us-east-1", date: @date1}
        expect(response.status).to eq(200)
        json_body = JSON.parse(response.body)
        expect(json_body.count).to eq(1)
       
      end
    end
    
  end
end