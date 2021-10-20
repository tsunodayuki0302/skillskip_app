class RecruitmentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    @recruitments = Recruitment.order("created_at DESC")
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    if @recruitment.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def recruitment_params
    params.permit(:heading, :content, :category_id, :price, :image).merge(user_id: current_user.id)
  end
end
