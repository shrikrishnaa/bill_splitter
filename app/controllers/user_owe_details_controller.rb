class UserOweDetailsController < ApplicationController
  before_action :set_user_owe_detail, only: [:show, :edit, :update, :destroy]

  # GET /user_owe_details
  # GET /user_owe_details.json
  def index
    @user_owe_details = UserOweDetail.all
  end

  # GET /user_owe_details/1
  # GET /user_owe_details/1.json
  def show
  end

  # GET /user_owe_details/new
  def new
    @user_owe_detail = UserOweDetail.new
  end

  # GET /user_owe_details/1/edit
  def edit
  end

  # POST /user_owe_details
  # POST /user_owe_details.json
  def create
    @user_owe_detail = UserOweDetail.new(user_owe_detail_params)

    respond_to do |format|
      if @user_owe_detail.save
        format.html { redirect_to @user_owe_detail, notice: 'User owe detail was successfully created.' }
        format.json { render :show, status: :created, location: @user_owe_detail }
      else
        format.html { render :new }
        format.json { render json: @user_owe_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_owe_details/1
  # PATCH/PUT /user_owe_details/1.json
  def update
    respond_to do |format|
      if @user_owe_detail.update(user_owe_detail_params)
        format.html { redirect_to @user_owe_detail, notice: 'User owe detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_owe_detail }
      else
        format.html { render :edit }
        format.json { render json: @user_owe_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_owe_details/1
  # DELETE /user_owe_details/1.json
  def destroy
    @user_owe_detail.destroy
    respond_to do |format|
      format.html { redirect_to user_owe_details_url, notice: 'User owe detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_owe_detail
      @user_owe_detail = UserOweDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_owe_detail_params
      params.require(:user_owe_detail).permit(:owe_amount, :paid_amount, :status, :user_id)
    end
end
