# frozen_string_literal: true

class MunicipalityResidentsController < ApplicationController
  before_action :set_municipality_resident, only: %i[show edit update change_status]

  def index
    @municipality_residents = MunicipalityResident.includes(:address).all
  end

  def show; end

  def new
    @municipality_resident ||= MunicipalityResident.new
    @municipality_resident.build_address
  end

  def edit; end

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

  def change_status
    @municipality_resident.active = !@municipality_resident.active?
    if @municipality_resident.save
      flash[:success] = 'Status alterado com sucesso!'
      redirect_to municipality_residents_path
    else
      flash[:error] = 'Não foi possivel alterar o status!'
    end
  end

  private

  def set_municipality_resident
    @municipality_resident = MunicipalityResident.find(params[:id])
  end

  def municipality_resident_params
    params.require(:municipality_resident).permit(:full_name, :cpf, :cns, :email, :birthday, :phone_number,
                                                  :image, :active, address_attributes: %i[
                                                    zip_code address1 complement neighborhood city uf ibge
                                                  ])
  end
end
