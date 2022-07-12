class OwnerMailer < ApplicationMailer
  default from: 'bento_eats.com'

  def creation_email(information)
    @information = information
    mail(
      subject: '営業日のお知らせ',
      to: @information.owner.email
    )
  end
end
