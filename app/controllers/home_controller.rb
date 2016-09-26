class HomeController < ApplicationController
  def index
  		@skpkerjas = UserSkpKerja.select("*").joins("LEFT JOIN user_skp_kontrak ON user_skp_kerja.id_kontrak = user_skp_kontrak.id LEFT JOIN user ON user_skp_kontrak.uid = user.id WHERE user.BIDANG='12'")
  end

  def duplikat
  		@id = params[:id]
  		@skpkerja = UserSkpKerja.find(@id.to_i)
  end
end
