class CriteriaController < ApplicationController
  def index
    @criteria = Criterion.all
  end

  def sort
    params[:criteria].each_with_index do |criterion, index|
      Criterion.update_all({:rank => index+1}, {:id => criterion})
    end
    render :nothing => true  
  end

  def show
    @criterion = Criterion.find(params[:id])
  end

  def new
    @criterion = Criterion.new
  end

  def create
    @criterion = Criterion.new(params[:criterion])
    if @criterion.save
      flash[:notice] = "Successfully created criterion."
      redirect_to @criterion
    else
      render :action => 'new'
    end
  end

  def edit
    @criterion = Criterion.find(params[:id])
  end

  def update
    @criterion = Criterion.find(params[:id])
    if @criterion.update_attributes(params[:criterion])
      flash[:notice] = "Successfully updated criterion."
      redirect_to @criterion
    else
      render :action => 'edit'
    end
  end

  def destroy
    @criterion = Criterion.find(params[:id])
    @criterion.destroy
    flash[:notice] = "Successfully destroyed criterion."
    redirect_to criteria_url
  end
end
