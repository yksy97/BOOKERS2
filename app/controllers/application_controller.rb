class ApplicationController < ActionController::Base
  # ログインなしでトップページ以外に移行しようとするとログイン画面へリダイレクト
  before_action :authenticate_user!, except: [:top]
  # 下記のeditを消すと編集（仮）に行ける
  before_action :is_matching_login_user, only: [:edit, :update]

  before_action :set_user, only: [:create, :index, :update]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  
  
  def after_sign_in_path_for(resource)
    books_path
  end
  
  def after_sign_out_path_for(resource)
    about_path
  end
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  end
  
  def set_user
    @user = current_user 
end
end
