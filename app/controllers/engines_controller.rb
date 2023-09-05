class EnginesController < ApplicationController
  before_action :set_engine, only: %i[show edit update destroy]
  before_action :authorize_engine, except: [:index]

  def index
    @engines = Engine.all
  end

  def show
  end

  def new
    @engine = Engine.new
  end

  def edit
  end

  def create
    @engine = Engine.new(engine_params)

    respond_to do |format|
      if @engine.save
        format.html { redirect_to engine_url(@engine), notice: "Engine was successfully created." }
        format.json { render :show, status: :created, location: @engine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @engine.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @engine.update(engine_params)
        format.html { redirect_to engine_url(@engine), notice: "Engine was successfully updated." }
        format.json { render :show, status: :ok, location: @engine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @engine.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @engine.destroy

    respond_to do |format|
      format.html { redirect_to engines_url, notice: "Engine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_engine
    @engine = Engine.find(params[:id])
  end

  def engine_params
    params.require(:engine).permit(:type, :name, :description, :photo)
  end

  def authorize_engine
    unless current_user.administrador?
      redirect_to root_path, alert: "No tienes permisos para acceder a esta sección."
    end
  end
end
