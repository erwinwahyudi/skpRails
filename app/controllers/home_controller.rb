class HomeController < ApplicationController
  def index
  		@skpkerjas = UserSkpKerja.select("*").joins("LEFT JOIN user_skp_kontrak ON user_skp_kerja.id_kontrak = user_skp_kontrak.id LEFT JOIN user ON user_skp_kontrak.uid = user.id WHERE user.BIDANG='12' ORDER by user_skp_kontrak.id DESC")
  end

  def duplikat
  		@id = params[:id]
  		#@skpk = UserSkpKerja.select("*").joins("LEFT JOIN user_skp_kontrak ON user_skp_kerja.id_kontrak = user_skp_kontrak.id LEFT JOIN user ON user_skp_kontrak.uid = user.id WHERE user.BIDANG='12' AND user_skp_kerja.id='#{@id}'")
  		@skpk = UserSkpKerja.find(@id.to_i)
  		@skpkerja 			= UserSkpKerja.new
  		@skpkerja.uid 		= @skpk.uid
  		@skpkerja.id_skp 	= @skpk.id_skp
  		@skpkerja.uid_p 	= @skpk.uid_p
  		@skpkerja.jenis		= @skpk.jenis
  		@skpkerja.id_kontrak = @skpk.id_kontrak
  		@skpkerja.tgl		= @skpk.tgl
  		@skpkerja.mulai 	= @skpk.mulai
  		@skpkerja.selesai	= @skpk.selesai
  		@skpkerja.quant		= @skpk.quant
  		@skpkerja.qual 		= @skpk.qual
  		@skpkerja.qual_acc 	= @skpk.qual_acc
  		@skpkerja.biaya 	= @skpk.biaya
  		@skpkerja.ket 		= @skpk.ket
  		@skpkerja.status 	= @skpk.status
  		@skpkerja.status_waktu	= @skpk.status_waktu
  		@skpkerja.status_ket 	= @skpk.status_ket
  		@skpkerja.status_iknow 	= @skpk.status_iknow
  		@skpkerja.insert_time	= @skpk.insert_time
  		
  		# @skpkerja_save = UserSkpKerja.create( uid: "#{@skpkerja.uid}", id_skp: "#{@skpkerja.id_skp}" , uid_p: "#{@skpkerja.uid_p}", jenis: "#{@skpkerja.jenis}", id_kontrak: "#{@skpkerja.id_kontrak}", tgl: "#{@skpkerja.tgl}", mulai: "#{@skpkerja.mulai}}", selesai: "#{@skpkerja.selesai}", quant: "#{@skpkerja.quant}", qual: "#{@skpkerja.qual}", qual_acc: "#{@skpkerja.qual_acc}", biaya: "#{@skpkerja.biaya}", ket: "#{@skpkerja.ket}", status: "#{@skpkerja.status}", status_iknow: "#{@skpkerja.status_iknow}", status_ket: "#{@skpkerja.status_ket}", status_waktu: "#{@skpkerja.status_waktu}",  insert_time: "#{@skpkerja.insert_time}"  )
  		@skpkerja_save = @skpkerja.save
  		if @skpkerja_save
  			redirect_to skp_path, notice: 'Sukses Tambah'
  			# puts @skpkerja_save.errors.full_messages
  		end	
  end
end
