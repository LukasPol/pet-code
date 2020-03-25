class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :update, :destroy]
  before_action :verify_total_cost, only: [:create]

  # GET /animals
  def index
    @animals = Animal.all

    render json: @animals
  end

  # GET /animals/1
  def show
    render json: @animal
  end

  # POST /animals
  def create
    @animal = Animal.new(animal_params)

    @person = Person.find(@Animal.person_id)

    if @animal.save
      render json: @animal, status: :created, location: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animals/1
  def update
    if @animal.update(animal_params)
      render json: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animals/1
  def destroy
    @animal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def animal_params
      params.require(:animal).permit(:name, :monthlyCost, :type_animal_id, :person_id)
    end

    def verify_total_cost
      @person_id = params[:animal][:person_id]
      @animals_person = Animal.joins(:person).where(person_id: person_id)
      @totalCost = 0 

      @animals_person.each do |animal|
        @totalCost += animal.monthlyCost
      end

      #### CONTINUE TEMP
    end
end
