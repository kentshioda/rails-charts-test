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

#存在する地区名
# '三田', '元赤坂', '元麻布', '六本木', '北青山', '南青山',
# '南麻布', '台場', '新橋', '東新橋', '東麻布', '浜松町', '海岸',
# '港南', '白金', '白金台', '芝', '芝公園', '芝大門', '芝浦',
# '虎ノ門', '西新橋', '西麻布', '赤坂', '高輪', '麻布十番',
# '麻布台', '麻布永坂町', '麻布狸穴町'
