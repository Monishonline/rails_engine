class ItemSaleSerializer < ActiveModel::Serializer
  attribute :formatted_revenue, key: :best_day
  
  def formatted_revenue
    object
  end
end
