class Api::JavascriptsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  #doorkeeper_for :all
  doorkeeper_for :all, :if => lambda { request.xhr? }

  # GET /api/javascripts
  # GET /api/javascripts.json
  def index
    @api_javascripts = Api::Javascript.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @api_javascripts }
    end
  end

  # GET /api/javascripts/1
  # GET /api/javascripts/1.json
  def show
    @api_javascript = Api::Javascript.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api_javascript }
    end
  end

  # GET /api/javascripts/new
  # GET /api/javascripts/new.json
  def new
    @api_javascript = Api::Javascript.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @api_javascript }
    end
  end

  # GET /api/javascripts/1/edit
  def edit
    @api_javascript = Api::Javascript.find(params[:id])
  end

  # POST /api/javascripts
  # POST /api/javascripts.json
  def create

    logger.debug "PARAMS: #{params.inspect}"

    @api_javascript = Api::Javascript.new(params[:api_javascript])

    respond_to do |format|
      if @api_javascript.save
        format.html { redirect_to @api_javascript, notice: 'Javascript was successfully created.' }
        format.json { render json: @api_javascript, status: :created, location: @api_javascript }
      else
        format.html { render action: "new" }
        format.json { render json: @api_javascript.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /api/javascripts/1
  # PUT /api/javascripts/1.json
  def update
    @api_javascript = Api::Javascript.find(params[:id])

    respond_to do |format|
      if @api_javascript.update_attributes(params[:api_javascript])
        format.html { redirect_to @api_javascript, notice: 'Javascript was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @api_javascript.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/javascripts/1
  # DELETE /api/javascripts/1.json
  def destroy
    @api_javascript = Api::Javascript.find(params[:id])
    @api_javascript.destroy

    respond_to do |format|
      format.html { redirect_to api_javascripts_url }
      format.json { head :no_content }
    end
  end
end
