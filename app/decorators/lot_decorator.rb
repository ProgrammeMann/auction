class LotDecorator < ApplicationDecorator
  delegate_all
      
  decorates_association :rates
  def rates_exists?
	object.rates.exists?
  end

  def auction_ended?
  	# Yegor, you need do this
  end

end