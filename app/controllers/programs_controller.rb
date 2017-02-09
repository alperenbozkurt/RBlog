class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]
  def index
    @programs = Program.all
  end
  def new
    @program = Program.new
  end
  def create
    @program = Program.new(strong_params)

    if @program.save
      flash[:Successfully] = "Program Eklendi"
      redirect_to program_path(@program)
    else
      flash[:Error] = "Program Eklenemedi"
      render :new
    end
  end
  def show

  end
  def edit

  end
  def update
    if @program.update(strong_params)
      flash[:Successfully] = "Program Güncellendi."
      redirect_to program_path(@program)
    else
      flash[:Error] = "Program Güncellenemedi."
      render :edit
    end
  end
  def destroy
    @program.destroy
    flash[:Successfully] = "Program Silindi"
    redirect_to programs_path
  end
  private

  def set_program
    @program = Program.find(params[:id])
  end
  def strong_params
    params.require(:program).permit(:name, :content, :link)
	end
end
