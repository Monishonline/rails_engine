class MerchantTotalRevenueSerializer < ActiveModel::Serializer
  attribute :formatted_revenue, key: :total_revenue

  def formatted_revenue
    object.to_s
  end
end
