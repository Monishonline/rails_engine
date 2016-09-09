class MerchantRevenueSerializer < ActiveModel::Serializer
  attribute :revenue

  def revenue
    object.to_s
  end
end
