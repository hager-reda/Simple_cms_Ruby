class SubjectsController < ApplicationController
  def index
    @subjects = Subject.sorted
    render('index')
  end

  def show
    @subject = Subject.find(params[:id])
    render ('show')
  end

  def new
    @subject = Subject.new()
    render ('new')
  end

  def create
  end
  
  def edit
  end
  def updated
  end

  def destroy
  end

  private
  
end
