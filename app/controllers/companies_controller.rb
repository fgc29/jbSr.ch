class CompaniesController < ApplicationController

  def index
    @companies = Company.all
    if params[:query].present?
      @companies = Company.search(params[:query])
    else
      puts "not found"
    end
  end

  def show
    @company = Company.find(params[:id])
    @job = AngelListApi.angel_list_search(@company.angel_list_id)
    @news = CrunchbaseApi.crunchbase_search(@company.name)
  end

  def follow
    current_user.companies << Company.find(params[:id]) unless current_user.companies.include?(Company.find(params[:id]))
    redirect_to(company_path)
  end

  def unfollow
    current_user.companies.delete(params[:id])
    redirect_to(company_path)
  end

  private
  def company_params
    params.require(:company).permit(:name, :url, :address)
  end

end
