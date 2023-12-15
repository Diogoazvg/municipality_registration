# frozen_string_literal: true

class MunicipalityResidentsController < ApplicationController
  before_action :set_municipality_resident, only: %i[show edit update destroy]

  # GET /municipality_residents or /municipality_residents.json
  def index
    @municipality_residents = MunicipalityResident.all
  end

  # GET /municipality_residents/1 or /municipality_residents/1.json
  def show; end

  # GET /municipality_residents/new
  def new
    @municipality_resident = MunicipalityResident.new
  end

  # GET /municipality_residents/1/edit
  def edit; end

  # POST /municipality_residents or /municipality_residents.json
  def create
    @municipality_resident = MunicipalityResident.new(municipality_resident_params)

    respond_to do |format|
      if @municipality_resident.save
        format.html do
          redirect_to municipality_resident_url(@municipality_resident),
                      notice: 'Municipality resident was successfully created.'
        end
        format.json { render :show, status: :created, location: @municipality_resident }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipality_resident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipality_residents/1 or /municipality_residents/1.json
  def update
    respond_to do |format|
      if @municipality_resident.update(municipality_resident_params)
        format.html do
          redirect_to municipality_resident_url(@municipality_resident),
                      notice: 'Municipality resident was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @municipality_resident }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipality_resident.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_municipality_resident
    @municipality_resident = MunicipalityResident.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def municipality_resident_params
    params.require(:municipality_resident).permit(:full_name, :cpf, :cns, :email, :birthday, :phone_number,
                                                  :image)
  end
end
