class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  layout 'admin'
  def index
    @team = Team.find(params[:team_id])
    @members = Member.where(team_id:params[:team_id])
  end


  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/new
  def new
    @team = Team.find(params[:team_id])
    @member = Member.new
    @member.team = @team
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
    @team = @member.team
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)
    respond_to do |format|
      if @member.save
        format.html { redirect_to :action => 'index' ,team_id: @member.team_id, notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to :action => 'index' ,team_id: @member.team_id, notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @member = Member.find(params[:id])
    @team = @member.team
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to :action => 'index' ,team_id: @member.team_id, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
      @team = @member.team
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.fetch(:member, {}).permit(:team_id,:first_name,:last_name)
    end
end
