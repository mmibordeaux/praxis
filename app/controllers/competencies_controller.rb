class CompetenciesController < ApplicationController
  before_action :set_competency, only: [:show, :edit, :update, :destroy]


  # GET /competencies
  # GET /competencies.json
  def index
    @competencies = Competency.all
    add_breadcrumb 'Compétences', :competencies_path
  end

  # GET /competencies/1
  # GET /competencies/1.json
  def show
    add_breadcrumb 'Référentiels', :referentials_path
    add_breadcrumb @competency.referential, @competency.referential
    add_breadcrumb @competency
  end

  # GET /competencies/new
  def new
    @referential = Referential.find params[:referential_id]
    @competency = Competency.new
    @competency.referential = @referential
    @competency.position =@referential.competencies.length + 1
  end

  # GET /competencies/1/edit
  def edit
    add_breadcrumb 'Référentiels', :referentials_path
    add_breadcrumb @competency.referential, @competency.referential
    add_breadcrumb @competency, @competency
    add_breadcrumb 'Modifier'
  end

  # POST /competencies
  # POST /competencies.json
  def create
    @competency = Competency.new(competency_params)

    respond_to do |format|
      if @competency.save
        format.html { redirect_to @competency, notice: 'Competency was successfully created.' }
        format.json { render :show, status: :created, location: @competency }
      else
        format.html { render :new }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competencies/1
  # PATCH/PUT /competencies/1.json
  def update
    respond_to do |format|
      if @competency.update(competency_params)
        format.html { redirect_to @competency, notice: 'Competency was successfully updated.' }
        format.json { render :show, status: :ok, location: @competency }
      else
        format.html { render :edit }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competencies/1
  # DELETE /competencies/1.json
  def destroy
    @competency.destroy
    respond_to do |format|
      format.html { redirect_to competencies_url, notice: 'Competency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competency
      @competency = Competency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competency_params
      params.require(:competency).permit(:name, :short_name, :description, :details, :position, :referential_id)
    end
end
