class MerchantTotalRevenueSerializer < ActiveModel::Serializer
  attribute :total_revenue

  def total_revenue
    object.to_s
  end
end
