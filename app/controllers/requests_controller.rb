class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]

  # GET /requests
  api :GET, '/requests', 'List requests'
  def index
    @requests = Request.all

    render json: @requests
  end

  # GET /requests/1
  api :GET, '/requests/:id', 'Show a request'
  def show
    render json: @request
  end

  # POST /requests
  api :POST, '/requests', 'Create a request'
  def create
    Request.transaction do
      @request = Request.new(request_params)

      if @request.save
        render json: @request, status: :created, location: @request
      else
        render json: @request.errors, status: :unprocessable_entity
      end
      raise_unexpected_exception
    end
  end

  # PATCH/PUT /requests/1
  api :PATCH, '/requests/:id', 'Update a request'
  api :PUT, '/requests/:id', 'Update a request'
  def update
    Request.transaction do
      if @request.update(request_params)
        render json: @request
      else
        render json: @request.errors, status: :unprocessable_entity
      end
      raise_unexpected_exception
    end
  end

  # DELETE /requests/1
  api :DELETE, '/requests/:id', 'Destroy a request'
  def destroy
    Request.transaction do
      @request.destroy
      raise_unexpected_exception
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit!.except(:reference, :updated_at, :created_at)
    end

    # Raise an exception in 5% of cases
    def raise_unexpected_exception
      chance = 1 + rand(100)
      if chance <= 5
        raise "Out of service!"
      end
    end
end
