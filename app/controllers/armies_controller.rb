class ArmiesController < ApplicationController
  before_action :set_army, only: [:show, :edit, :update, :destroy]

  # GET /armies
  # GET /armies.json
  def index
    @armies = Army.all
  end

  # GET /armies/1
  # GET /armies/1.json
  def show
  end

  # GET /armies/new
  def new
    @army = Army.new
    @unit_types = UnitType.all
    @tactics = Tactic.all
  end

  # GET /armies/1/edit
  def edit
  end

  # POST /armies
  # POST /armies.json
  def create
    @army = Army.new(army_params)
    @unit_types = UnitType.all

    respond_to do |format|
      if @army.save
        format.html { redirect_to armies_path, notice:  @army.name + ' was successfully created.' }
        format.json { render :show, status: :created, location: @army }
      else
        format.html { render :new }
        format.json { render json: @army.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /armies/1
  # PATCH/PUT /armies/1.json
  def update
    respond_to do |format|
      if @army.update(army_params)
        format.html { redirect_to armies_path, notice: @army.name + ' was successfully updated.' }
        format.json { render :show, status: :ok, location: @army }
      else
        format.html { render :edit }
        format.json { render json: @army.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armies/1
  # DELETE /armies/1.json
  def destroy
    @army.destroy
    respond_to do |format|
      format.html { redirect_to armies_path, notice:  @army.name + ' was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_army
      @army = Army.find(params[:id])
      @unit_types = UnitType.all
      @tactics = Tactic.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def army_params
      params.require(:army).permit(:name, :description, {units_attributes: [:id, :name, :quality, 
          :resilience, :strength, :hp, :cost, :sim_cost, :sim_shift, :unit_type_id, :_destroy, 
          {:unit_attribute_ids => []}, {:unit_tactics_attributes => [:id, :base_bias, :tactic_id, :unit_id, :_destroy]}]})
    end
end
