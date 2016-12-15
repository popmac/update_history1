class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  # GET /homes
  # GET /homes.json
  def index
    @users = User.all
    @reviews = Review.all.includes(:user)
    @histories = PaperTrail::Version.order('created_at DESC').includes(:item)
    if user_signed_in?
      # 未読の数
      @uncheck_histories = []
      @histories.each do |h|
        if h.item == nil
          next
        elsif h.event == "update"
          next
        else
          if h.item_type == "Review"
            if h.item.checked_reviews.where(checking_user_id: current_user.id, review_id: h.item.id)[0] == nil
              next
            end
            if h.item.checked_reviews.where(checking_user_id: current_user.id, review_id: h.item.id)[0].checked_flag == false
              @uncheck_histories << h
            end
          end
          if h.item_type == "Comment"
            if h.item.checked_comments.where(checking_user_id: current_user.id, review_id: h.item.review_id, comment_id: h.item.id)[0] == nil
              next
            end
            if h.item.checked_comments.where(checking_user_id: current_user.id, review_id: h.item.review_id, comment_id: h.item.id)[0].checked_flag == false
              @uncheck_histories << h
            end
          end
          if h.item_type == "Like"
            if h.item.checked_likes.where(checking_user_id: current_user.id, review_id: h.item.review_id, like_id: h.item.id)[0] == nil
              next
            end
            if h.item.checked_likes.where(checking_user_id: current_user.id, review_id: h.item.review_id, like_id: h.item.id)[0].checked_flag == false
              @uncheck_histories << h
            end
          end
        end
      end
    end
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.fetch(:home, {})
    end
end
