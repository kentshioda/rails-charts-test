class EcChartsController < ApplicationController
  def index
    @company = []
    company_count = RecordNumber.all.group(:company).count
    company_count.each_key do |company|
      @company << company
    end
    @company_count_by_day = Hash.new { |h, k| h[k] = [] }
    @company.each do |company|
      date_count = RecordNumber.select(:date, :count).where(company: company)
      date_count.each do |dc|
        @company_count_by_day[company] << [dc.date, dc.count]
      end
    end
  end
end
