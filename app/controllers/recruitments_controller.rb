class RecruitmentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_array, only: [:new, :create, :show, :edit]
  before_action :set_recruitment, only: [ :edit, :update, :show, :destroy]
  before_action :set_q, only: [:index, :search]

  def index
    @recruitments = Recruitment.order("created_at DESC")
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    if @recruitment.save
      redirect_to root_path(@recruitment)
    else
      render :new
    end
  end

  def show
  end

  # or @recruitment.record != nil edit アクションに追加

  def edit
  @category_parent_array = Category.where(ancestry: nil) 
    if current_user.id != @recruitment.user_id
      redirect_to root_path
    end
  end

  def update
    if @recruitment.update(recruitment_params)
      redirect_to recruitment_path(@recruitment)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @recruitment.user_id
      @recruitment.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Category.ransack(params[:q])
  end

  def recruitment_params
    params.require(:recruitment).permit(:heading, :content, :category_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_array
    @category_parent_array = Category.where(ancestry: nil)
  end

  def set_recruitment
    @recruitment = Recruitment.find(params[:id])
  end
  
end
