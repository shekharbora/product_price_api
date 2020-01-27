require 'faraday'
URL = 'https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json'.freeze
CODE_NAME = { 
				      'US East (N. Virginia)' => 'us-east-1',
				      'US West (N. California)' => 'us-west-1',
				      'EU (Paris)' => 'eu-west-3', 
				      'US West (Oregon)' => 'us-west-2'         
				    }

class PricingLoger
	def initialize(client=Faraday)   
    @client  = client   
  end


  def get_data
  	data = callApi
  	save_price(data)
  end


  def callApi
  	begin
	  	data  =  @client.get(URL)
	  	data  =  JSON.parse(data.body)
	  rescue StandardError => e
      puts e
	  end  
  end
	
	def save_price(data)
		product    = data['products']
		price_data = data['terms']['OnDemand']

      price_data.each_pair do |k, v|
        v.each_pair do |_k, _v|
          effective_date = _v['effectiveDate']
          sku = _v['sku']
          location_name = product[sku]['attributes']['location']
          _v['priceDimensions'].each_pair do |_key, _value|  
          	create_product(_value,effective_date,location_name)  if _value.present?         
          end
        end
      end
    end

	def create_product(price_data,date,location_name)
    aws_price = AwsProductPrice.new
    aws_price.description        = price_data['description'] 
    aws_price.begin_range        = price_data['beginRange'] 
    aws_price.end_range          = price_data['endRange']
    aws_price.price_per_unit     = price_data['pricePerUnit']['USD']
    aws_price.unit               = price_data['unit']
    aws_price.location_name      = location_name
    aws_price.location_code_name = get_code_name(location_name)
    aws_price.effective_date     = date         
    aws_price.save
  end


  def get_code_name(location_name)
  	CODE_NAME[location_name]
  end


  

end
