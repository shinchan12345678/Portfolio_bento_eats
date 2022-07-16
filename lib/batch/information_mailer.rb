class Batch::InformationMailer
  def self.informationMailer
    informations_is_today = Information.where("open_date = ? and is_valid = ?", Date.current, 0)
    informations_is_today.each do |info|
      OwnerMailer.creation_email(info).deliver_now
    end
  end
end
