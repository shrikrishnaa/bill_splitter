class UserEventDetailsController < ApplicationController
  before_action :set_user_event_detail, only: [:show, :edit, :update, :destroy]

  # GET /user_event_details
  # GET /user_event_details.json
  def index
    @user_event_details = UserEventDetail.all
  end

  # GET /user_event_details/1
  # GET /user_event_details/1.json
  def show
  end

  # GET /user_event_details/new
  def new
    @user_event_detail = UserEventDetail.new
  end

  # GET /user_event_details/1/edit
  def edit
  end

  # POST /user_event_details
  # POST /user_event_details.json
  def create
    @user_event_detail = UserEventDetail.new(user_event_detail_params)

    respond_to do |format|
      if @user_event_detail.save
        format.html { redirect_to @user_event_detail, notice: 'User event detail was successfully created.' }
        format.json { render :show, status: :created, location: @user_event_detail }
      else
        format.html { render :new }
        format.json { render json: @user_event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_event_details/1
  # PATCH/PUT /user_event_details/1.json
  def update
    respond_to do |format|
      if @user_event_detail.update(user_event_detail_params)
        format.html { redirect_to @user_event_detail, notice: 'User event detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_event_detail }
      else
        format.html { render :edit }
        format.json { render json: @user_event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_event_details/1
  # DELETE /user_event_details/1.json
  def destroy
    @user_event_detail.destroy
    respond_to do |format|
      format.html { redirect_to user_event_details_url, notice: 'User event detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_event_detail
      @user_event_detail = UserEventDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_event_detail_params
      params.require(:user_event_detail).permit(:paid_amount, :user_id, :event_id)
    end
end
