class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:show, :edit, :update, :destroy]

  def index
    @maintenances = Maintenance.all
  end

  def show
  end

  def new
    @maintenance = Maintenance.new
  end

  def edit
    redirect_to root_path, alert: "No tienes permisos para realizar esta acción." unless current_user.administrador?
  end

  def create
    @maintenance = Maintenance.new(maintenance_params)

    respond_to do |format|
      if @maintenance.save
        format.html { redirect_to maintenance_url(@maintenance), notice: "Maintenance was successfully created." }
        format.json { render :show, status: :created, location: @maintenance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    redirect_to root_path, alert: "No tienes permisos para realizar esta acción." unless current_user.administrador?
  end

  def destroy
    redirect_to root_path, alert: "No tienes permisos para realizar esta acción." unless current_user.administrador?
  end

  private

  def set_maintenance
    @maintenance = Maintenance.find(params[:id])
  end

  def maintenance_params
    params.require(:maintenance).permit(:engine_id, :type, :city, :materials, :technician_email, :maintenance_date)
  end
end

