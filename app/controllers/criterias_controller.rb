class CriteriasController < ApplicationController
  def index
    @criterias = Criteria.all
  end
  
  def show
    @criteria = Criteria.find(params[:id])
  end
  
  def new
    @criteria = Criteria.new
  end
  
  def create
    @criteria = Criteria.new(params[:criteria])
    if @criteria.save
      flash[:notice] = "Successfully created criteria."
    redirect_to criterias_url
    else
      render :action => 'new'
    end
  end
  
  def update
    @criteria = Criteria.find(params[:id])
    if @criteria.update_attributes(params[:criteria])
      flash[:notice] = "Successfully updated criteria."
    redirect_to criterias_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @criteria = Criteria.find(params[:id])
    @criteria.destroy
    flash[:notice] = "Successfully destroyed criteria."
    redirect_to criterias_url
  end
end
