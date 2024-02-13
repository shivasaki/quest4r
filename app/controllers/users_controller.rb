class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  layout "user_new", :only=>"new"
  
    def new
      @user = User.new
    end

    def edit
    end

    def login
    end

    def create
      @user = User.new(user_params)
      binding.pry
      case @user.grade
      when 1, 2, 3, 4, 5
      if @user.email.include?(ed.ritsumei.ac.jp)
        respond_to do |format|
          if @user.save
            format.html { redirect_to qustions_index_col_path, notice: 'user was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      else
        format.html { render :new }
      end
      when 0
        respond_to do |format|
          if @user.save
            format.html { redirect_to questions_hs_path, notice: 'user was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      else
      end
    end

    def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to @user, notice: 'user was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end

      def destroy
        @user.destroy
        respond_to do |format|
          format.html { redirect_to site_root_path , notice: 'user was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          if logged_in?
            log_in
            current_user
          else
            redirect_to user_new_path
          end
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
          params.require(:user).permit(:name, :email, :password, :grade)
        end
end