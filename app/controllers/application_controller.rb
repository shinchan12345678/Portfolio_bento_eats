class ApplicationController < ActionController::Base
  protected
  # 強制サインアウトさせる関数
  # カスタマーにログインしたまま、オーナーにログインできないよう制御
  def confirm_customer_log_in
    sign_out if customer_signed_in?
  end

  # オーナーにログインしたまま、カスタマーにログインできないよう制御
  def confirm_owner_log_in
    sign_out if owner_signed_in?
  end

end
