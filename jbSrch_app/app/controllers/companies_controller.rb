class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    # @job = AngelListApi.search(@company.angel_list_id)
    jobs
  end

  private
  def company_params
    params.require(:company).permit(:name, :url, :address)
  end

end
