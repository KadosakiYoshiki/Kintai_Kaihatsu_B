class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  include AttendancesHelper
  
  def correct_user
      @user = User.find(params[:id])
      # 管理者ではないユーザが他ユーザ情報へアクセスしようとしているか確認
      if !current_user.admin && !current_user?(@user)
        flash[:danger] = "アクセス権限がありません"
        redirect_to(user_path(@current_user))
      end
  end
end
