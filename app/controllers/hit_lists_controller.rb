class HitListsController < ApplicationController
  before_action :set_hit_list, only: [:show, :edit, :update, :destroy]

  # GET /hit_lists
  # GET /hit_lists.json
  def index
    @hit_lists = HitList.all
  end

  # GET /hit_lists/1
  # GET /hit_lists/1.json
  def show
  end

  # GET /hit_lists/new
  def new
    @hit_list = HitList.new
  end

  # GET /hit_lists/1/edit
  def edit
  end

  # POST /hit_lists
  # POST /hit_lists.json
  def create
    @hit_list = HitList.new(hit_list_params)

    respond_to do |format|
      if @hit_list.save
        format.html { redirect_to @hit_list, notice: 'Hit list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hit_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @hit_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hit_lists/1
  # PATCH/PUT /hit_lists/1.json
  def update
    respond_to do |format|
      if @hit_list.update(hit_list_params)
        format.html { redirect_to @hit_list, notice: 'Hit list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hit_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hit_lists/1
  # DELETE /hit_lists/1.json
  def destroy
    @hit_list.destroy
    respond_to do |format|
      format.html { redirect_to hit_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hit_list
      @hit_list = HitList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hit_list_params
      params.require(:hit_list).permit(:listing_id, :filter_id)
    end
end
