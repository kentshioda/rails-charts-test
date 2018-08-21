class ChartsController < ApplicationController
  def index
    @places = []
    places2count = RealEstate.all.group(:place).count
    places2count.each_key do |place|
      @places << place
    end
    years = []
    years2count = RealEstate.all.group(:year).count
    years2count.each_key do |year|
      years << year
    end
    @place_year_price_per_sm = Hash.new { |h, k| h[k] = [] }
    @places.each do |place|
      years.each do |year|
        # @year2price = RealEstate.where(place: place).group(:year).average(:price)
        prices_per_sm = []
        place_year2info = RealEstate.select(:price, :square_meter).where(place: place, year: year)
        place_year2info.each do |info|
          prices_per_sm << info.price / info.square_meter
        end
        if prices_per_sm.size.zero? then
          average_price = 0
        else
          average_price = prices_per_sm.sum / prices_per_sm.size
        end
        @place_year_price_per_sm[place] << [year, average_price]
      end
    end
  end
end
