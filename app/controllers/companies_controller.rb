class CompaniesController < ApplicationController

  def index
    @companies = Company.all

    if params[:query].present?
      @companies = Company.search(params[:query])
    end

  end

  def show
    @company = Company.find(params[:id])
    @job = AngelListApi.angel_list_search(@company.angel_list_id)
    @news = CrunchbaseApi.crunchbase_search(@company.name)
  end

  private
  def company_params
    params.require(:company).permit(:name, :url, :address)
  end

end
