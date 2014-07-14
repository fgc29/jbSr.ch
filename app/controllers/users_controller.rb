class UsersController < ApplicationController

  before_action :authorize, only: [:edit, :update, :destroy, :add]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user] = @user.id
      redirect_to companies_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @company = Company.find(params[:id])
    @job = AngelListApi.angel_list_search(@company.angel_list_id)
    @news = CrunchbaseApi.crunchbase_search(@company.name)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def add_company
    @user = User.find(params[:id])
    @user.companies << Company.find(params[:company_id])
    redirect_to(company_path)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:current_user] = nil
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
  end
end
