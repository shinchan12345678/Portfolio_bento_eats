class OwnerMailer < ApplicationMailer
  default from: 'notice_bentoeats@bentoeats.net'

  def creation_email(information)
    @information = information
    mail(
      subject: 'テイクアウト営業日のお知らせ',
      to: @information.owner.email
      # to: "uv4171@gmail.com"
    )
  end
end
