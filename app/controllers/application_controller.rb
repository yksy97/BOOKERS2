class ApplicationController < ActionController::Base
  # ログインなしでトップページ以外に移行しようとするとログイン画面へリダイレクト
  before_action :authenticate_user!, except: [:top]
  
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
  
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  
  # ユーザー情報の編集をアクセス制限
  before_action :check_user, only: [:edit, :update, :destroy]
  
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
