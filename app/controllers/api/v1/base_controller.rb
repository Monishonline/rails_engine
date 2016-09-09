class Api::V1::BaseController < ApplicationController

  def random(table)
    table.order("RANDOM()").take
  end

end