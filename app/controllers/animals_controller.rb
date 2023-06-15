class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[ show edit update destroy add_animal]

  # GET /animals or /animals.json
  def index
    @animals = Animal.all
  end

  # GET /animals/1 or /animals/1.json
  def show
  end

  # GET /animals/new
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals or /animals.json
  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
        @animal.nextvaccine = @animal.vaccineapplied + 121
        @animal.save
      if @animal.save
        format.html { redirect_to animal_url(@animal), notice: "Animal was successfully created." }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1 or /animals/1.json
  def update
      if current_venue && current_venue.id == @animal.venue_id || current_user && current_user.id == @animal.user_id
        respond_to do |format|
            @animal.nextvaccine = @animal.vaccineapplied + 121
            @animal.update(animal_params)
          if @animal.update(animal_params)
            format.html { redirect_to animal_url(@animal), notice: "Animal was successfully updated." }
            format.json { render :show, status: :ok, location: @animal }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @animal.errors, status: :unprocessable_entity }
          end
        end
      end
  end

  # DELETE /animals/1 or /animals/1.json
  def destroy
    @animal.destroy

    respond_to do |format|
      format.html { redirect_to animals_url, notice: "Animal was successfully destroyed." }
      format.json { head :no_content }
    end
  end
    
  def add_animal
          @animal.add_animal(@animal, current_user)
           @animal.update(animal_params)
          redirect_back(fallback_location: root_path)
      
  end
    
  def add_animal_venue
      @animal = Animal.find(params[:id])
      if current_venue && !@animal.venue_id?
          @animal.add_animal_venue(@animal, current_venue)
          @animal.update(animal_params)
          redirect_back(fallback_location: root_path)
      end
  end
    
  def release_animal_venue
      @animal = Animal.find(params[:id])
      if @animal.venue_id == current_venue.id
          @animal.release_animal_venue(@animal)
          @animal.update(animal_params)
          redirect_back(fallback_location: root_path)
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animal_params
      params.require(:animal).permit(:petname, :ppname, :species, :food, :notes, :vaccineapplied, :nextvaccine, :user_id, :venue_id)
    end
end
