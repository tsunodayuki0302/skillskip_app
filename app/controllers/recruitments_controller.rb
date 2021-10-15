class RecruitmentsController < ApplicationController
  def index
    @recruitment = Recruitment.all
  end

  def new
    @recruitment = Recruitment.new
  end
end
