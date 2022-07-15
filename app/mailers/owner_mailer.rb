class OwnerMailer < ApplicationMailer
  default from: 'bento_eats.net'

  def creation_email(information)
    @information = information
    mail(
      subject: '営業日のお知らせ',
      # to: @information.owner.email
      to: "uv4171@gmail.com"
    )
  end
end
