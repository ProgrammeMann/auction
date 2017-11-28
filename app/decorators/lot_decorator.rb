class LotDecorator < ApplicationDecorator
  delegate_all
      
  decorates_association :rates
  def max_rate
  	object.rates = Lot.select("max(rates.value)").joins(:rates).where("lots.id = ?", object.id)
  end

  def rates_exists?
	object.rates.exists?
  end

end
