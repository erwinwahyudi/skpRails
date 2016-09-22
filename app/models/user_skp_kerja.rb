class UserSkpKerja < ApplicationRecord
	self.table_name = "user_skp_kerja"

	belongs_to :UserSkpKontrak
end
