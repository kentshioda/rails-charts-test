class ChartsController < ApplicationController
  def index
    @chart_data_mita = RealEstate.where(place: '三田').order(:year).group(:year).average(:price)
    @chart_data_nishiazabu = RealEstate.where(place: '西麻布').order(:year).group(:year).average(:price)
    @chart_data_roppongi = RealEstate.where(place: '六本木').order(:year).group(:year).average(:price)
    @chart_data_shirogane = RealEstate.where(place: '白金').order(:year).group(:year).average(:price)
    @chart_data_shibaura = RealEstate.where(place: '芝浦').order(:year).group(:year).average(:price)
  end
end

=begin
存在する地区名
'三田', '元赤坂', '元麻布', '六本木', '北青山', '南青山',
'南麻布', '台場', '新橋', '東新橋', '東麻布', '浜松町', '海岸',
'港南', '白金', '白金台', '芝', '芝公園', '芝大門', '芝浦',
'虎ノ門', '西新橋', '西麻布', '赤坂', '高輪', '麻布十番',
'麻布台', '麻布永坂町', '麻布狸穴町'
=end
