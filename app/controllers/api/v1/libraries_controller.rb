class Api::V1::LibrariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_v1_library, only: [:show, :update, :destroy]

  # GET /api/v1/libraries
  def index
    @api_v1_libraries = Api::V1::Library.all

    render json: @api_v1_libraries
  end

  # GET /api/v1/libraries/1
  def show
    render json: @api_v1_library
  end

  # POST /api/v1/libraries
  def create
    @api_v1_library = Api::V1::Library.new(api_v1_library_params)

    if @api_v1_library.save
      render json: @api_v1_library, status: :created, location: @api_v1_library
    else
      render json: @api_v1_library.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/libraries/1
  def update
    if @api_v1_library.update(api_v1_library_params)
      render json: @api_v1_library
    else
      render json: @api_v1_library.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/libraries/1
  def destroy
    @api_v1_library.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_library
      @api_v1_library = Api::V1::Library.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_library_params
      params.require(:api_v1_library).permit(:name)
    end
end
