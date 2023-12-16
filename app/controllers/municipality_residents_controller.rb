# frozen_string_literal: true

class MunicipalityResidentsController < ApplicationController
  before_action :set_municipality_resident, only: %i[show edit update change_status]

  def index
    @municipality_residents = if params[:search].present?
                                MunicipalityResident.search(params[:search]).results
                              else
                                MunicipalityResident.search('*').results
                              end
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
        format.html { redirect_to municipality_residents_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @municipality_resident.update(municipality_resident_params)
        format.html { redirect_to municipality_resident_url(@municipality_resident) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def change_status
    @municipality_resident.active = !@municipality_resident.active?
    redirect_to municipality_residents_path if @municipality_resident.save
  end

  private

  def set_municipality_resident
    @municipality_resident = MunicipalityResident.find(params[:id])
  end

  def municipality_resident_params
    params.require(:municipality_resident).permit(:full_name, :cpf, :cns, :email, :birthday, :phone_number,
                                                  :image, :image_data, :active, address_attributes: %i[
                                                    id zip_code address1 complement neighborhood city uf ibge ibge_code
                                                  ])
  end
end
