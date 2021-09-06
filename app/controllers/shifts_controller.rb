class ShiftsController < ApplicationController
  before_action :set_shift, only: %i[ show edit update destroy ]

  layout 'admin'
  # GET /shifts or /shifts.json
  def index
    @member = Member.find(params[:member_id])
    @shifts = Shift.where(member_id: params[:member_id])
  end

  # GET /shifts/1 or /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    @member = Member.find(params[:member_id])
    @shift = Shift.new
    @shift.member = @member
  end

  # GET /shifts/1/edit
  def edit
    @shift = Shift.find(params[:id])
    @member = @shift.member

  end

  # POST /shifts or /shifts.json
  def create
    @shift = Shift.new(shift_params)
    @member = @shift.member
    respond_to do |format|
      if @shift.save
        format.html { redirect_to :action => 'index' , member_id: @shift.member_id , notice: "Shift was successfully created." }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new,member_id: @shift.member_id, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1 or /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to :action => 'index' ,member_id: @shift.member_id, notice: "Shift was successfully updated." }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit, member_id: @shift.member_id, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1 or /shifts/1.json
  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to :action => 'index' ,member_id: @shift.member_id, notice: "Shift was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def delete
    @shift = Shift.find(params[:id])
    @member = @shift.member
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
      @member = @shift.member
    end

    # Only allow a list of trusted parameters through.
    def shift_params
      params.fetch(:shift, {}).permit(:member_id,:day,:start_time,:end_time)
    end
end
