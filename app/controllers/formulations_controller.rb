class FormulationsController < ApplicationController
  before_action :set_formulation, only: [:show, :update, :destroy]

  # GET /formulations
  def index
    @formulations = Formulation.includes(formulation_ingredients: [:ingredient]).all

    render json: @formulations, include: { formulation_ingredients: { include: :ingredient, except: [:ingredient_id, :formulation_id] } }
  end

  # GET /formulations/1
  def show
    render json: @formulation, include: { formulation_ingredients: { include: :ingredient, except: [:ingredient_id, :formulation_id] } }
  end

  # POST /formulations
  def create
    @formulation = Formulation.new(formulation_params)

    if @formulation.save
      render json: @formulation, status: :created, location: @formulation
    else
      render json: @formulation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /formulations/1
  def update
    if @formulation.update(formulation_params)
      render json: @formulation
    else
      render json: @formulation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /formulations/1
  def destroy
    @formulation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulation
      @formulation = Formulation.includes(formulation_ingredients: [:ingredient]).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def formulation_params
      params.require(:formulation).permit(:name)
    end
end
