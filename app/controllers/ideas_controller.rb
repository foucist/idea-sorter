class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def sort
   #Parameters: {"id"=>"1", "ideas"=>["4", "12", "1", "2", "3", "5", "6", "7", "8", "9", "11", "10"]}
    params[:ideas].each_with_index do |idea, index|
      IdeaRank.update_all({:rank => index+1}, {:criterion_id => params[:id], :idea_id => idea})
    end
    render :nothing => true
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(params[:idea])
    if @idea.save
      flash[:notice] = "Successfully created idea."
      redirect_to ideas_url
    else
      render :action => 'new'
    end
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(params[:idea])
      flash[:notice] = "Successfully updated idea."
      redirect_to ideas_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:notice] = "Successfully destroyed idea."
    redirect_to ideas_url
  end
end
