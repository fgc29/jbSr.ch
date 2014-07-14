class InvestorsController < ApplicationController

  def index
    @companies = Company.where(investor: true)
  end

  def show
    @company = Company.find(params[:id])
    @job = AngelListApi.angel_list_search(@company.angel_list_id)
    @news = CrunchbaseApi.crunchbase_search(@company.name)
  end

end
