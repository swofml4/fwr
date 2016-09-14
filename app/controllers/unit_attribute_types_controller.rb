class UnitAttributeTypesController < ApplicationController
  before_action :set_unit_attribute_type, only: [:show, :edit, :update, :destroy]

  # GET /unit_attribute_types
  # GET /unit_attribute_types.json
  def index
    @unit_attribute_types = UnitAttributeType.all
  end

  # GET /unit_attribute_types/1
  # GET /unit_attribute_types/1.json
  def show
  end

  # GET /unit_attribute_types/new
  def new
    @unit_attribute_type = UnitAttributeType.new
    @unit_attribute_types = UnitAttributeType.all
  end

  # GET /unit_attribute_types/1/edit
  def edit
    @unit_attribute_types = UnitAttributeType.all
  end

  # POST /unit_attribute_types
  # POST /unit_attribute_types.json
  def create
    @unit_attribute_type = UnitAttributeType.new(unit_attribute_type_params)

    respond_to do |format|
      if @unit_attribute_type.save
        format.html { redirect_to @unit_attribute_type, notice: 'Unit attribute type was successfully created.' }
        format.json { render :show, status: :created, location: @unit_attribute_type }
      else
        format.html { render :new }
        format.json { render json: @unit_attribute_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_attribute_types/1
  # PATCH/PUT /unit_attribute_types/1.json
  def update
    respond_to do |format|
      if @unit_attribute_type.update(unit_attribute_type_params)
        format.html { redirect_to @unit_attribute_type, notice: 'Unit attribute type was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit_attribute_type }
      else
        format.html { render :edit }
        format.json { render json: @unit_attribute_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_attribute_types/1
  # DELETE /unit_attribute_types/1.json
  def destroy
    @unit_attribute_type.destroy
    respond_to do |format|
      format.html { redirect_to unit_attribute_types_url, notice: 'Unit attribute type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_attribute_type
      @unit_attribute_type = UnitAttributeType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_attribute_type_params
      params.require(:unit_attribute_type).permit(:name, :rule, :adjustment, :negated_by_unit_attribute_type_id)
    end
end
