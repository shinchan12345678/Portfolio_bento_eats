class Public::InformationsController < Public::ApplicationController
  def index
  end

  def serach
    default_sw = [35.443736713821224, 136.76085201562503]
    default_ne = [35.47170185598229, 136.82676998437503]
    latitude_s, longitude_s = default_sw.map { |i| i }
    latitude_e, longitude_e = default_ne.map { |i| i }
    @informations = Information.map_view_ports(latitude_s, latitude_e, longitude_s, longitude_e)
    gon.informations = @informations
  end
end
