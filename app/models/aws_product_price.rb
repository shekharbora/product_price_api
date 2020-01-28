class AwsProductPrice < ApplicationRecord

  def self.filter_by_region_and_date(code_name,effective_date)
    prices = ''
    if effective_date.present?
      prices = where(location_code_name: code_name, effective_date: effective_date)
    else
      prices = where(location_code_name: code_name)
    end
    prices
  end


end
