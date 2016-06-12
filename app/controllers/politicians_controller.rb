class PoliticiansController < ApplicationController
  before_action :set_politician, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:search, :index, :show]
  before_action :check_user, except: [:search, :index, :show, :new, :create, :destroy]

  # GET /politicians
  # GET /politicians.json

  def search
    if params[:search].present?
      @politicians = Politician.search(params[:search])
    else
      @politicians = Politician.all
    end
  end


  def index
    @politicians = Politician.all
  end

  def show
    @reviews = Review.where(politician_id: @politician.id).order("created_at DESC")
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def new
    @politician = Politician.new
  end

  def edit
  end

  def create
    @politician = Politician.new(politician_params)
    @politician.user_id = current_user.id

    respond_to do |format|
      if @politician.save
        format.html { redirect_to @politician, notice: 'Politician was successfully created.' }
        format.json { render :show, status: :created, location: @politician }
      else
        format.html { render :new }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @politician.update(politician_params)
        format.html { redirect_to @politician, notice: 'Politician profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @politician }
      else
        format.html { render :edit }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /politicians/1
  # DELETE /politicians/1.json
  def destroy
    @politician.destroy
    respond_to do |format|
      format.html { redirect_to politicians_url, notice: 'The Politician was successfully destroyed. Booo!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_politician
      @politician = Politician.find(params[:id])
    end

    def check_user
      unless current_user.admin?
          redirect_to root_url, alert: "Sorry, only admins can do that!"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def politician_params
      params.require(:politician).permit(:first_name, :last_name, :party, :occupation, :country, :area, :wikipage, :image)
    end
end
