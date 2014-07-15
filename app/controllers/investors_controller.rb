class InvestorsController < ApplicationController

  def index
    @companies = Company.where(investor: true)
  end

  def show
    @company = Company.find(params[:id])
    @job = AngelListApi.angel_list_search(@company.angel_list_id)
    @news = CrunchbaseApi.crunchbase_search(@company.name)
    if (Time.current.to_a[7 ] - @company.updated_at.to_a[7]) > 3
       CrunchbaseApi.update_db(@company.name)
    end
  end

end
