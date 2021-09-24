# frozen_string_literal: true

# :nocov:
# Super basic controller for Doodads
class DoodadsController < ApplicationController
  include WorksCited::Params
  before_action :set_doodad, only: %i[show edit update destroy]

  # GET /doodads
  def index
    @doodads = Doodad.all
  end

  # GET /doodads/1
  def show; end

  # GET /doodads/new
  def new
    @doodad = Doodad.new
  end

  # GET /doodads/1/edit
  def edit; end

  # POST /doodads
  def create
    @doodad = Doodad.new(doodad_params)

    if @doodad.save
      redirect_to @doodad, notice: 'Doodad was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /doodads/1
  def update
    if @doodad.update(doodad_params)
      redirect_to @doodad, notice: 'Doodad was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /doodads/1
  def destroy
    @doodad.destroy
    redirect_to doodads_url, notice: 'Doodad was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_doodad
    @doodad = Doodad.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def doodad_params
    params.require(:doodad).permit(:name, :description, works_cited_params)
  end
end
# :nocov:
