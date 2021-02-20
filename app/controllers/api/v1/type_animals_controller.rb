class Api::V1::TypeAnimalsController < ApplicationController
  before_action :set_type_animal, only: [:show, :update, :destroy]

  # GET /type_animals
  def index
    @type_animals = TypeAnimal.all

    render json: @type_animals
  end

  # GET /type_animals/1
  def show
    render json: @type_animal
  end

  # POST /type_animals
  def create
    @type_animal = TypeAnimal.new(type_animal_params)

    if @type_animal.save
      render json: @type_animal, status: :created
    else
      render json: @type_animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /type_animals/1
  def update
    if @type_animal.update(type_animal_params)
      render json: @type_animal
    else
      render json: @type_animal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /type_animals/1
  def destroy
    @type_animal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_animal
      @type_animal = TypeAnimal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def type_animal_params
      params.require(:type_animal).permit(:name)
    end
end
