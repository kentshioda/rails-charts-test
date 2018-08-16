class ChartsController < ApplicationController
  def index
    places = Array.new()
    places2count = RealEstate.all.group(:place).count
    places2count.each_key do |key|
      places << key
    end
    @place2year_price = Hash.new { |h, k| h[k] = [] }
    places.each do |value|
      @year2price = RealEstate.where(place: value).group(:year).average(:price)
      @year2price.each_pair do |k, v|
        @place2year_price[value] << [k, v]
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
