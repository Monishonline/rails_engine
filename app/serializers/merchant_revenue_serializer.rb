class MerchantRevenueSerializer < ActiveModel::Serializer
  attribute :formatted_revenue, key: :revenue
  
  def formatted_revenue
    "$#{object.revenue}"
  end
end