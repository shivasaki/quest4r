class UserController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
  
    def new
      @user = User.new
    end

    def edit
    end
  
    def create
      @user = User.new(user_params)
  
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'user was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
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
          format.html { redirect_to site_top_path , notice: 'user was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
          params.require(:name, :email, :password, :type).permit(:name, :email, :password, :type)
        end
end