class AwsProductPriceSerializer < ActiveModel::Serializer
  attributes :description, :begin_range, :end_range, :price_per_unit, :unit, :effective_date
end
