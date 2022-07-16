require "rails_helper"

RSpec.describe OwnerMailer, type: :mailer do
  let(:owner) { FactoryBot.create(:owner) }
  let(:information) { FactoryBot.create(:information, owner: owner) }

  # rubocop:disable all
  let(:text_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/plain; charset=UTF-8' }
    part.body.raw_source
  end
  let(:html_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/html; charset=UTF-8' }
    part.body.raw_source
  end

  describe "#creation_email" do
    let(:mail) { OwnerMailer.creation_email(information) }

    it "想定通りのメールが生成されている" do
      # ヘッダー
      expect(mail.subject).to eq('テイクアウト営業日のお知らせ')
      expect(mail.to).to eq(['test@com'])
      expect(mail.from).to eq(['notice_bentoeats@bentoeats.net'])

      # text形式の本文
      expect(text_body).to match('ベントーイーツからのご連絡')
      expect(text_body).to match(Date.current.to_s)
      expect(text_body).to match('営業は9時から' )

      # html形式の本文
      expect(html_body).to match('ベントーイーツからのご連絡')
      expect(html_body).to match(Date.current.to_s)
      expect(html_body).to match('営業は9時から' )
    end
  end
  # rubocop:enable all
end
