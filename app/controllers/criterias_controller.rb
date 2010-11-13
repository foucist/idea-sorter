class CriteriasController < ApplicationController
  def index
    @criterias = Criteria.all
  end

  def sort
    #Parameters: {"criterias"=>["2", "1", "3", "4", "5"], "id"=>"1"}
    #params[:criteria].each_with_index do |idea, index|
    #  Criteria.update_all({:rank => index+1}, {:id => params[:id]})
    #end
    #render :nothing => true  
  end

  def show
    @criteria = Criteria.find(params[:id])
  end

  def edit
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
