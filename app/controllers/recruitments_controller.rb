class RecruitmentsController < ApplicationController
  def index
    @recruitment = Recruitment.all
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new
    if @recruitment.save
      redirect_to root_path(@recruitment)
    else
      render :new
    end
  end

  private
  def recruitment_params
    params.require(:recruitment).permit(:heading, :content, :category_id, :price, :image).merge(user_id: current_user.id)
  end
end
