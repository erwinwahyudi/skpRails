class HomeController < ApplicationController
	
  def index
  		@skpkerja = UserSkpKerja.joins("INNER JOIN user_skp_kontrak ON user_skp_kontrak.id = user_skp_kerja.id_kontrak")
  end

end
