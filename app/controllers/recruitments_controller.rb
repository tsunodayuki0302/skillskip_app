class RecruitmentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    @recruitments = Recruitment.order("created_at DESC")
  end

  def new
    @recruitment = Recruitment.new
    @category_parent_array = Category.where(ancestry: nil)
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    if @recruitment.save
      redirect_to root_path
    else
      render :new
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def recruitment_params
    params.permit(:heading, :content, :category_id, :price, :image).merge(user_id: current_user.id)
  end
end
