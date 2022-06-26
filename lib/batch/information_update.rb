class Batch::InformationUpdate
  def self.informationUpdate
    informations_is_false = Information.where("close_date < ? and is_valid = ?", Date.current, 0)
    informations_is_false.each do |info|
      info.update(is_valid: 1)
    end
  end
end
