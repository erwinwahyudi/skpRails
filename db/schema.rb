# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160922065453) do

  create_table "addon_gol", primary_key: "ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "KODE",    limit: 2, null: false
    t.string  "NAMA",    limit: 3, null: false
    t.string  "PANGKAT", limit: 1, null: false
    t.string  "KET",               null: false
    t.index ["KODE", "PANGKAT"], name: "KODE", unique: true, using: :btree
  end

  create_table "addon_status", primary_key: "ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "TYPE", limit: 2,   null: false
    t.integer "KODE", limit: 2,   null: false
    t.string  "NAMA", limit: 100, null: false
    t.index ["NAMA"], name: "NAMA", unique: true, using: :btree
    t.index ["TYPE", "KODE"], name: "TYPE", unique: true, using: :btree
  end

  create_table "bagian", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id_bidang", limit: 2,  null: false
    t.string  "nama",                 null: false
    t.string  "pimpinan",  limit: 20
    t.index ["id_bidang", "nama"], name: "id_bidang", unique: true, using: :btree
    t.index ["pimpinan"], name: "pimpinan", unique: true, using: :btree
  end

  create_table "bidang", primary_key: "ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "KODE",       limit: 5
    t.string  "RBA",        limit: 25
    t.boolean "KP",                     default: false, null: false
    t.text    "JUDUL",      limit: 255
    t.boolean "ISFAKULTAS",             default: false, null: false
    t.string  "PIMPINAN",   limit: 20
    t.string  "URL"
    t.index ["KODE"], name: "KODE", unique: true, using: :btree
    t.index ["PIMPINAN"], name: "PIMPINAN", unique: true, using: :btree
    t.index ["RBA"], name: "RBA", unique: true, using: :btree
  end

  create_table "jabatan", primary_key: "ID", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "KODE",      limit: 5
    t.string  "JUDUL",                                                        null: false
    t.string  "JUDUL2",                                                       null: false
    t.integer "LEVEL",     limit: 2,                                                       unsigned: true
    t.integer "KELAS",     limit: 2,                                                       unsigned: true
    t.decimal "TUNJANGAN",           precision: 15, scale: 2, default: "0.0"
    t.integer "GOL",       limit: 2
    t.string  "SUUBGOL",   limit: 1
    t.integer "JENIS",     limit: 2,                          default: 1,     null: false
    t.boolean "ISUMUM"
  end

  create_table "jabatan_tugas", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id_jabatan", limit: 2,   null: false, unsigned: true
    t.string  "nama",       limit: 300, null: false
    t.index ["id_jabatan", "nama"], name: "id_jabatan", unique: true, using: :btree
  end

  create_table "jurusanpegawai", primary_key: "ID", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "KODE",        limit: 8
    t.string  "JUDUL",       limit: 100
    t.integer "ID_FAKULTAS", limit: 2,   null: false
    t.string  "PIMPINAN",    limit: 20
    t.string  "URL"
    t.index ["ID_FAKULTAS"], name: "ID_FAKULTAS", using: :btree
    t.index ["KODE"], name: "KODE", unique: true, using: :btree
    t.index ["PIMPINAN"], name: "PIMPINAN", using: :btree
  end

  create_table "kegiatan_panitia", primary_key: "ID", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "KODE",         limit: 5
    t.string "NAMA",                       null: false
    t.string "TEMPAT",                     null: false
    t.date   "MULAI",                      null: false
    t.date   "SELESAI",                    null: false
    t.string "SK",           limit: 100,   null: false
    t.string "KETUA",        limit: 20,    null: false
    t.string "WAKETUA",      limit: 20
    t.string "SEKRETARIS",   limit: 20
    t.string "WASEKRETARIS", limit: 20
    t.string "BENDAHARA",    limit: 20
    t.string "WABENDAHARA",  limit: 20
    t.text   "KET",          limit: 65535
    t.index ["BENDAHARA"], name: "BENDAHARA", using: :btree
    t.index ["KETUA"], name: "KETUA", using: :btree
    t.index ["KODE"], name: "KODE", unique: true, using: :btree
    t.index ["SEKRETARIS"], name: "SEKRETARIS", using: :btree
    t.index ["WABENDAHARA"], name: "WABENDAHARA", using: :btree
    t.index ["WAKETUA"], name: "WAKETUA", using: :btree
    t.index ["WASEKRETARIS"], name: "WASEKRETARIS", using: :btree
  end

  create_table "kegiatan_panitia_a", primary_key: "ID", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ID_KEGIATAN",                        null: false, unsigned: true
    t.string  "USER",        limit: 20,             null: false
    t.integer "JENIS",       limit: 2,  default: 1, null: false
    t.index ["ID_KEGIATAN"], name: "ID_KEGIATAN", using: :btree
    t.index ["USER"], name: "USER", using: :btree
  end

  create_table "log", primary_key: "ID", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "USER",    limit: 20,    null: false
    t.datetime "WAKTU",                 null: false
    t.string   "IP",      limit: 100,   null: false
    t.text     "PROGRAM", limit: 65535, null: false
    t.text     "URL",     limit: 65535, null: false
    t.text     "KET",     limit: 65535
    t.index ["USER"], name: "USER", using: :btree
  end

  create_table "module_A", primary_key: "ID", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "IDUSER",  limit: 20,              null: false
    t.string "TINGKAT",            default: "", null: false
    t.index ["IDUSER"], name: "IDUSER", unique: true, using: :btree
  end

  create_table "module_E", primary_key: "ID", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "IDUSER",   limit: 20,                 null: false
    t.string  "TINGKAT",             default: "",    null: false
    t.string  "LEVEL",    limit: 1,  default: "0",   null: false
    t.boolean "PROSDATA",            default: false, null: false
    t.boolean "RESPWD",              default: false, null: false
    t.index ["IDUSER"], name: "IDUSER", unique: true, using: :btree
  end

  create_table "module_Y", primary_key: "ID", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "IDUSER",       limit: 20,                 null: false
    t.string  "TINGKAT",                 default: "",    null: false
    t.boolean "ATURKEGIATAN",            default: false, null: false
    t.index ["IDUSER"], name: "IDUSER", unique: true, using: :btree
  end

  create_table "pdekan", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id_fakultas", limit: 2,  null: false
    t.integer "level",       limit: 2,  null: false
    t.string  "urusan",                 null: false
    t.string  "uid",         limit: 20
    t.index ["id_fakultas", "level"], name: "id_fakultas", unique: true, using: :btree
    t.index ["uid"], name: "uid", unique: true, using: :btree
  end

  create_table "pegawaipanitia", primary_key: "ID", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "IDUSER",      limit: 20,    null: false
    t.string  "NAMA",                      null: false
    t.string  "TEMPAT",                    null: false
    t.date    "MULAI"
    t.date    "SELESAI"
    t.text    "KET",         limit: 65535
    t.text    "POSISI",      limit: 255
    t.string  "SK",          limit: 100,   null: false
    t.integer "ID_KEGIATAN",                            unsigned: true
    t.index ["IDUSER"], name: "IDUSER", using: :btree
    t.index ["ID_KEGIATAN"], name: "ID_KEGIATAN", using: :btree
  end

  create_table "pengumuman", primary_key: "ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date    "TANGGAL",                                 null: false
    t.time    "JAM",                                     null: false
    t.string  "JUDUL",                                   null: false
    t.string  "PERMALINK", limit: 350,                   null: false
    t.text    "RINCIAN",   limit: 65535,                 null: false
    t.string  "IDUSER",    limit: 20,                    null: false
    t.boolean "GLOBAL",                  default: false, null: false
    t.index ["IDUSER"], name: "IDUSER", using: :btree
    t.index ["JUDUL", "TANGGAL"], name: "JUDUL", unique: true, using: :btree
  end

  create_table "prodipegawai", primary_key: "ID", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "KODE",        limit: 5,  null: false
    t.string  "JUDUL",                  null: false
    t.integer "ID_JURUSAN",  limit: 2,  null: false, unsigned: true
    t.integer "ID_FAKULTAS", limit: 2,  null: false
    t.string  "PIMPINAN",    limit: 20
    t.index ["ID_FAKULTAS"], name: "ID_FAKULTAS", using: :btree
    t.index ["ID_JURUSAN"], name: "ID_JURUSAN", using: :btree
    t.index ["KODE"], name: "KODE", unique: true, using: :btree
    t.index ["PIMPINAN"], name: "PIMPINAN", using: :btree
  end

  create_table "skp", primary_key: "tahun", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "status", limit: 2, default: 1, null: false
    t.date    "expire",                       null: false
  end

  create_table "skp_satuan", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nama", null: false
    t.index ["nama"], name: "nama", unique: true, using: :btree
  end

  create_table "subbagian", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id_bidang", limit: 2,  null: false
    t.integer "id_bagian",            null: false
    t.string  "nama",                 null: false
    t.string  "pimpinan",  limit: 20
    t.index ["id_bagian", "nama"], name: "id_bagian", unique: true, using: :btree
    t.index ["id_bidang"], name: "id_bidang", using: :btree
    t.index ["pimpinan"], name: "pimpinan", unique: true, using: :btree
  end

  create_table "ung", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "REKTOR", limit: 20
    t.string "PR1",    limit: 20
    t.string "PR2",    limit: 20
    t.string "PR3",    limit: 20
    t.string "PR4",    limit: 20
    t.index ["PR1"], name: "PR1", using: :btree
    t.index ["PR2"], name: "PR2", using: :btree
    t.index ["PR3"], name: "PR3", using: :btree
    t.index ["PR4"], name: "PR4", using: :btree
    t.index ["REKTOR"], name: "REKTOR", using: :btree
  end

  create_table "user", primary_key: "ID", id: :string, limit: 20, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Users and global privileges" do |t|
    t.string   "NIP",            limit: 30
    t.string   "NIDN",           limit: 30
    t.string   "NAMA",           limit: 200,                 null: false
    t.string   "NAMA_DEPAN",     limit: 150,                 null: false
    t.string   "GELAR_DEPAN",    limit: 50
    t.string   "GELAR_BELAKANG", limit: 50
    t.string   "PASSWORD",       limit: 65,                  null: false
    t.string   "NPASSWORD",      limit: 65
    t.date     "LASTCHANGEPWD",                              null: false
    t.date     "TGLLAHIR"
    t.string   "TINGKAT",        limit: 100, default: "",    null: false
    t.string   "KELAMIN",        limit: 1,   default: "L",   null: false
    t.integer  "BIDANG",         limit: 2,                   null: false
    t.integer  "LOKASI",         limit: 2,   default: 0,     null: false, unsigned: true
    t.integer  "STATUSPEGAWAI",  limit: 2,   default: 0,     null: false, unsigned: true
    t.integer  "JABATAN",        limit: 2,                   null: false, unsigned: true
    t.date     "TMTJ"
    t.integer  "JABATAN2",       limit: 2,                                unsigned: true
    t.date     "TMTJ2"
    t.string   "HP",             limit: 20
    t.string   "EMAIL",          limit: 200
    t.date     "TANGGALM",                                   null: false
    t.integer  "STATUSKERJA",    limit: 2,   default: 0,     null: false, unsigned: true
    t.integer  "PRODI",          limit: 2,                                unsigned: true
    t.integer  "JENISTENAGA",    limit: 2,   default: 0,     null: false, unsigned: true
    t.string   "GOLP",           limit: 1
    t.string   "SUBGOLP",        limit: 1
    t.date     "TMTGP"
    t.integer  "BIDANGT",        limit: 2
    t.integer  "SUBBAGIAN"
    t.integer  "SUBBAGIAN2"
    t.integer  "BAGIAN"
    t.integer  "BAGIAN2"
    t.boolean  "STATUSLOGIN",                default: false, null: false
    t.datetime "ACTIVITYLOGIN"
    t.boolean  "NEEDUPDATE",                 default: false, null: false
    t.string   "HASH",                                       null: false
    t.datetime "intime",                                     null: false
    t.index ["BAGIAN"], name: "BAGIAN", using: :btree
    t.index ["BAGIAN2"], name: "BAGIAN2", using: :btree
    t.index ["BIDANG"], name: "BIDANG", using: :btree
    t.index ["BIDANGT"], name: "BIDANGT", using: :btree
    t.index ["EMAIL"], name: "EMAIL", unique: true, using: :btree
    t.index ["HP"], name: "HP", unique: true, using: :btree
    t.index ["JABATAN"], name: "JABATAN", using: :btree
    t.index ["JABATAN2"], name: "JABATAN2", using: :btree
    t.index ["PRODI"], name: "PRODI", using: :btree
    t.index ["SUBBAGIAN"], name: "SUBBAGIAN", using: :btree
    t.index ["SUBBAGIAN2"], name: "SUBBAGIAN2", using: :btree
  end

  create_table "user_skp", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "tahun",                                      null: false
    t.string   "uid",          limit: 20,                    null: false
    t.integer  "gol"
    t.integer  "jab",          limit: 2,                     null: false, unsigned: true
    t.integer  "uk",           limit: 2,                     null: false
    t.integer  "bag"
    t.integer  "sbag"
    t.integer  "jab_2",        limit: 2,                                  unsigned: true
    t.integer  "uk_2",         limit: 2
    t.integer  "bag_2"
    t.integer  "sbag_2"
    t.string   "uid_p",        limit: 20,                    null: false
    t.integer  "gol_p",                                      null: false
    t.integer  "jab_p",        limit: 2,                     null: false, unsigned: true
    t.integer  "uk_p",         limit: 2
    t.integer  "bag_p"
    t.integer  "sbag_p"
    t.string   "uid_ap",       limit: 20
    t.integer  "gol_ap"
    t.integer  "jab_ap",       limit: 2,                                  unsigned: true
    t.integer  "uk_ap",        limit: 2
    t.integer  "bag_ap"
    t.integer  "sbag_ap"
    t.integer  "status",       limit: 2,     default: 0,     null: false
    t.datetime "status_waktu",                               null: false
    t.date     "status_acc"
    t.datetime "insert_time",                                null: false
    t.boolean  "finish",                     default: false, null: false
    t.boolean  "child",                      default: false, null: false
    t.boolean  "adj",                        default: false, null: false
    t.datetime "adj_waktu"
    t.integer  "lamu",         limit: 2,     default: 0,     null: false
    t.text     "ngango",       limit: 65535
    t.index ["bag"], name: "bag", using: :btree
    t.index ["bag_2"], name: "bag_2", using: :btree
    t.index ["bag_ap"], name: "bag_ap", using: :btree
    t.index ["bag_p"], name: "bag_p", using: :btree
    t.index ["gol"], name: "gol", using: :btree
    t.index ["gol_ap"], name: "gol_ap", using: :btree
    t.index ["gol_p"], name: "gol_p", using: :btree
    t.index ["jab"], name: "jab", using: :btree
    t.index ["jab_2"], name: "jab_2", using: :btree
    t.index ["jab_ap"], name: "jab_ap", using: :btree
    t.index ["jab_p"], name: "jab_p", using: :btree
    t.index ["sbag"], name: "sbag", using: :btree
    t.index ["sbag_2"], name: "sbag_2", using: :btree
    t.index ["sbag_ap"], name: "sbag_ap", using: :btree
    t.index ["sbag_p"], name: "sbag_p", using: :btree
    t.index ["tahun", "uid", "jab", "uk", "bag", "sbag"], name: "tahun", unique: true, using: :btree
    t.index ["uid"], name: "uid", using: :btree
    t.index ["uid_ap"], name: "uid_ap", using: :btree
    t.index ["uid_p"], name: "uid_p", using: :btree
    t.index ["uk"], name: "uk", using: :btree
    t.index ["uk_2"], name: "uk_2", using: :btree
    t.index ["uk_ap"], name: "uk_ap", using: :btree
    t.index ["uk_p"], name: "uk_p", using: :btree
  end

  create_table "user_skp_adj", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "uid",        limit: 20,              null: false
    t.integer  "id_skp",                             null: false, unsigned: true
    t.integer  "id_kontrak",                                      unsigned: true
    t.integer  "proc",       limit: 2,               null: false
    t.integer  "jab_index",  limit: 2,   default: 1, null: false
    t.string   "nama_tugas", limit: 300,             null: false
    t.integer  "quant",                                           unsigned: true
    t.integer  "lama",                                            unsigned: true
    t.integer  "lama_bln",   limit: 2
    t.integer  "biaya",                                           unsigned: true
    t.datetime "uptime",                             null: false
    t.index ["id_kontrak"], name: "id_kontrak", unique: true, using: :btree
    t.index ["id_skp"], name: "id_skp", using: :btree
    t.index ["uid"], name: "uid", using: :btree
  end

  create_table "user_skp_attitude", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "id_skp",                  null: false, unsigned: true
    t.string   "uid",          limit: 20, null: false
    t.integer  "tahun",                   null: false
    t.integer  "orientasi",    limit: 2
    t.integer  "integritas",   limit: 2
    t.integer  "komitmen",     limit: 2
    t.integer  "disiplin",     limit: 2
    t.integer  "kerjasama",    limit: 2
    t.integer  "kepemimpinan", limit: 2
    t.datetime "last_update",             null: false
    t.index ["id_skp"], name: "id_skp", unique: true, using: :btree
    t.index ["uid"], name: "uid", using: :btree
  end

  create_table "user_skp_kerja", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "uid",          limit: 20,                   null: false
    t.integer  "id_skp",                                    null: false, unsigned: true
    t.integer  "jenis",        limit: 2,                    null: false
    t.integer  "id_kontrak",                                null: false, unsigned: true
    t.date     "tgl",                                       null: false
    t.time     "mulai",                                     null: false
    t.time     "selesai",                                   null: false
    t.integer  "quant",                                                  unsigned: true
    t.integer  "qual",                                                   unsigned: true
    t.integer  "qual_acc",                                               unsigned: true
    t.integer  "biaya",                                                  unsigned: true
    t.text     "ket",          limit: 65535
    t.integer  "status",       limit: 2,     default: 0,    null: false
    t.datetime "status_waktu",                              null: false
    t.string   "status_ket"
    t.boolean  "status_iknow",               default: true, null: false
    t.string   "uid_p",        limit: 20
    t.datetime "insert_time",                               null: false
    t.index ["id_skp"], name: "id_skp", using: :btree
    t.index ["mulai"], name: "mulai", using: :btree
    t.index ["selesai"], name: "selesai", using: :btree
    t.index ["tgl"], name: "tgl", using: :btree
    t.index ["uid"], name: "uid", using: :btree
    t.index ["uid_p"], name: "uid_p", using: :btree
  end

  create_table "user_skp_kerja_n", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "id_kerja",                                  null: false, unsigned: true
    t.string   "uid",          limit: 20,                   null: false
    t.integer  "id_skp",                                    null: false, unsigned: true
    t.date     "tgl",                                       null: false
    t.time     "mulai",                                     null: false
    t.time     "selesai",                                   null: false
    t.integer  "qual",                                                   unsigned: true
    t.integer  "qual_acc",                                               unsigned: true
    t.integer  "biaya",                                                  unsigned: true
    t.text     "ket",          limit: 65535
    t.integer  "status",       limit: 2,     default: 0,    null: false
    t.datetime "status_waktu",                              null: false
    t.boolean  "status_iknow",               default: true, null: false
    t.string   "uid_p",        limit: 20
    t.string   "status_ket"
    t.datetime "insert_time",                               null: false
    t.index ["id_kerja"], name: "id_kerja", using: :btree
    t.index ["id_skp"], name: "id_skp", using: :btree
    t.index ["mulai"], name: "mulai", using: :btree
    t.index ["selesai"], name: "selesai", using: :btree
    t.index ["tgl"], name: "tgl", using: :btree
    t.index ["uid"], name: "uid", using: :btree
    t.index ["uid_p"], name: "uid_p", using: :btree
  end

  create_table "user_skp_kerjas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skp_kontrak", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "uid",        limit: 20,                                       null: false
    t.string  "kode",       limit: 5
    t.integer "id_skp",                                                      null: false, unsigned: true
    t.integer "jab_index",  limit: 2,                            default: 1, null: false
    t.string  "nama_tugas", limit: 300,                                      null: false
    t.decimal "ak",                     precision: 10, scale: 4
    t.integer "quant",                                                                    unsigned: true
    t.integer "satuan",                                                                   unsigned: true
    t.integer "lama",                                                                     unsigned: true
    t.integer "lama_bln",   limit: 2
    t.integer "biaya",                                                                    unsigned: true
    t.index ["id_skp", "jab_index", "nama_tugas"], name: "id_skp", unique: true, using: :btree
    t.index ["satuan"], name: "satuan", using: :btree
    t.index ["uid", "kode", "id_skp"], name: "uid", unique: true, using: :btree
  end

  create_table "user_skp_kontraks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skp_kreatif", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "uid",          limit: 20,                 null: false
    t.integer  "id_skp",                                  null: false, unsigned: true
    t.string   "nama",         limit: 300,                null: false
    t.string   "fname",                                   null: false
    t.integer  "status",       limit: 2,   default: 0,    null: false
    t.datetime "status_waktu",                            null: false
    t.string   "status_ket"
    t.boolean  "status_iknow",             default: true, null: false
    t.string   "uid_p",        limit: 20
    t.integer  "nilai_p",      limit: 2
    t.datetime "insert_time",                             null: false
    t.index ["id_skp", "nama"], name: "id_skp", unique: true, using: :btree
    t.index ["uid"], name: "uid", using: :btree
    t.index ["uid_p"], name: "uid_p", using: :btree
  end

  create_table "user_skp_lamu", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "id_skp",                                     null: false, unsigned: true
    t.integer  "level",        limit: 2,                     null: false
    t.string   "uid",          limit: 20,                    null: false
    t.datetime "waktu",                                      null: false
    t.text     "isi",          limit: 65535,                 null: false
    t.boolean  "i_know",                     default: false, null: false
    t.boolean  "bos_know",                   default: false, null: false
    t.boolean  "big_bos_know",               default: false, null: false
    t.index ["id_skp", "level"], name: "id_skp", unique: true, using: :btree
    t.index ["uid"], name: "uid", using: :btree
  end

  create_table "user_skp_nilai", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "id_skp",                                             null: false, unsigned: true
    t.string   "uid_p",        limit: 20
    t.decimal  "skp",                        precision: 5, scale: 2, null: false
    t.decimal  "skp_bkn",                    precision: 5, scale: 2, null: false
    t.decimal  "perilaku",                   precision: 5, scale: 2, null: false
    t.decimal  "prestasi",                   precision: 5, scale: 2, null: false
    t.decimal  "prestasi_bkn",               precision: 5, scale: 2, null: false
    t.text     "log",          limit: 65535,                         null: false
    t.datetime "insert_time",                                        null: false
    t.index ["id_skp"], name: "id_skp", unique: true, using: :btree
    t.index ["uid_p"], name: "uid_p", using: :btree
  end

  create_table "user_skp_nlog", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "uid",        limit: 20,                           null: false
    t.integer "id_skp",                                          null: false, unsigned: true
    t.integer "id_kontrak",                                      null: false, unsigned: true
    t.integer "jenis",      limit: 2,                            null: false
    t.string  "nama",                                            null: false
    t.integer "output",                                                       unsigned: true
    t.decimal "mutu",                  precision: 10, scale: 2
    t.decimal "lama_jam",              precision: 10, scale: 2
    t.integer "lama_bln",   limit: 2,                                         unsigned: true
    t.bigint  "biaya",                                                        unsigned: true
    t.decimal "hitung",                precision: 17, scale: 10
    t.decimal "hitung_bkn",            precision: 17, scale: 10
    t.decimal "nilai",                 precision: 17, scale: 10, null: false
    t.decimal "nilai_bkn",             precision: 17, scale: 10, null: false
    t.index ["id_skp", "id_kontrak", "jenis"], name: "id_skp", unique: true, using: :btree
    t.index ["uid", "id_skp"], name: "uid", using: :btree
  end

  create_table "user_skp_plog", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "id_skp",            null: false, unsigned: true
    t.string   "uid_p",  limit: 20, null: false
    t.integer  "gol_p",             null: false
    t.integer  "jab_p",  limit: 2,  null: false, unsigned: true
    t.integer  "uk_p",   limit: 2
    t.integer  "bag_p"
    t.integer  "sbag_p"
    t.date     "tgl",               null: false
    t.datetime "intime",            null: false
    t.datetime "uptime"
    t.index ["bag_p"], name: "bag_p", using: :btree
    t.index ["gol_p"], name: "gol_p", using: :btree
    t.index ["id_skp", "tgl"], name: "id_skp", unique: true, using: :btree
    t.index ["jab_p"], name: "jab_p", using: :btree
    t.index ["sbag_p"], name: "sbag_p", using: :btree
    t.index ["uid_p"], name: "uid_p", using: :btree
    t.index ["uk_p"], name: "uk_p", using: :btree
  end

  add_foreign_key "bagian", "bidang", column: "id_bidang", primary_key: "ID", name: "bagian_ibfk_1", on_update: :cascade
  add_foreign_key "bagian", "user", column: "pimpinan", primary_key: "ID", name: "bagian_ibfk_2", on_update: :cascade, on_delete: :nullify
  add_foreign_key "bidang", "user", column: "PIMPINAN", primary_key: "ID", name: "bidang_ibfk_1", on_update: :cascade, on_delete: :nullify
  add_foreign_key "jabatan_tugas", "jabatan", column: "id_jabatan", primary_key: "ID", name: "jabatan_tugas_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "jurusanpegawai", "bidang", column: "ID_FAKULTAS", primary_key: "ID", name: "jurusanpegawai_ibfk_1", on_update: :cascade
  add_foreign_key "jurusanpegawai", "user", column: "PIMPINAN", primary_key: "ID", name: "jurusanpegawai_ibfk_2", on_update: :cascade, on_delete: :nullify
  add_foreign_key "kegiatan_panitia", "user", column: "BENDAHARA", primary_key: "ID", name: "kegiatan_panitia_ibfk_3", on_update: :cascade
  add_foreign_key "kegiatan_panitia", "user", column: "KETUA", primary_key: "ID", name: "kegiatan_panitia_ibfk_1", on_update: :cascade
  add_foreign_key "kegiatan_panitia", "user", column: "SEKRETARIS", primary_key: "ID", name: "kegiatan_panitia_ibfk_2", on_update: :cascade
  add_foreign_key "kegiatan_panitia", "user", column: "WABENDAHARA", primary_key: "ID", name: "kegiatan_panitia_ibfk_6", on_update: :cascade
  add_foreign_key "kegiatan_panitia", "user", column: "WAKETUA", primary_key: "ID", name: "kegiatan_panitia_ibfk_4", on_update: :cascade
  add_foreign_key "kegiatan_panitia", "user", column: "WASEKRETARIS", primary_key: "ID", name: "kegiatan_panitia_ibfk_5", on_update: :cascade
  add_foreign_key "kegiatan_panitia_a", "kegiatan_panitia", column: "ID_KEGIATAN", primary_key: "ID", name: "kegiatan_panitia_a_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "kegiatan_panitia_a", "user", column: "USER", primary_key: "ID", name: "kegiatan_panitia_a_ibfk_2", on_update: :cascade
  add_foreign_key "log", "user", column: "USER", primary_key: "ID", name: "log_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "module_A", "user", column: "IDUSER", primary_key: "ID", name: "module_A_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "module_E", "user", column: "IDUSER", primary_key: "ID", name: "module_E_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "module_Y", "user", column: "IDUSER", primary_key: "ID", name: "module_Y_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "pdekan", "bidang", column: "id_fakultas", primary_key: "ID", name: "pdekan_ibfk_2", on_update: :cascade
  add_foreign_key "pdekan", "user", column: "uid", primary_key: "ID", name: "pdekan_ibfk_1", on_update: :cascade
  add_foreign_key "pegawaipanitia", "kegiatan_panitia", column: "ID_KEGIATAN", primary_key: "ID", name: "pegawaipanitia_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "pegawaipanitia", "user", column: "IDUSER", primary_key: "ID", name: "pegawaipanitia_ibfk_1", on_update: :cascade
  add_foreign_key "pengumuman", "user", column: "IDUSER", primary_key: "ID", name: "pengumuman_ibfk_1", on_update: :cascade
  add_foreign_key "prodipegawai", "bidang", column: "ID_FAKULTAS", primary_key: "ID", name: "prodipegawai_ibfk_2", on_update: :cascade
  add_foreign_key "prodipegawai", "jurusanpegawai", column: "ID_JURUSAN", primary_key: "ID", name: "prodipegawai_ibfk_1", on_update: :cascade
  add_foreign_key "prodipegawai", "user", column: "PIMPINAN", primary_key: "ID", name: "prodipegawai_ibfk_3", on_update: :cascade, on_delete: :nullify
  add_foreign_key "subbagian", "bagian", column: "id_bagian", name: "subbagian_ibfk_2", on_update: :cascade
  add_foreign_key "subbagian", "bidang", column: "id_bidang", primary_key: "ID", name: "subbagian_ibfk_1", on_update: :cascade
  add_foreign_key "subbagian", "user", column: "pimpinan", primary_key: "ID", name: "subbagian_ibfk_3", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ung", "user", column: "PR1", primary_key: "ID", name: "ung_ibfk_2", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ung", "user", column: "PR2", primary_key: "ID", name: "ung_ibfk_3", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ung", "user", column: "PR3", primary_key: "ID", name: "ung_ibfk_4", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ung", "user", column: "PR4", primary_key: "ID", name: "ung_ibfk_5", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ung", "user", column: "REKTOR", primary_key: "ID", name: "ung_ibfk_1", on_update: :cascade, on_delete: :nullify
  add_foreign_key "user", "bagian", column: "BAGIAN", name: "user_ibfk_5", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user", "bagian", column: "BAGIAN2", name: "user_ibfk_6", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user", "bidang", column: "BIDANG", primary_key: "ID", name: "user_ibfk_7", on_update: :cascade
  add_foreign_key "user", "bidang", column: "BIDANGT", primary_key: "ID", name: "user_ibfk_1", on_update: :cascade
  add_foreign_key "user", "jabatan", column: "JABATAN", primary_key: "ID", name: "user_ibfk_8", on_update: :cascade
  add_foreign_key "user", "jabatan", column: "JABATAN2", primary_key: "ID", name: "user_ibfk_9", on_update: :cascade
  add_foreign_key "user", "prodipegawai", column: "PRODI", primary_key: "ID", name: "user_ibfk_2", on_update: :cascade, on_delete: :nullify
  add_foreign_key "user", "subbagian", column: "SUBBAGIAN", name: "user_ibfk_3", on_update: :cascade, on_delete: :nullify
  add_foreign_key "user", "subbagian", column: "SUBBAGIAN2", name: "user_ibfk_4", on_update: :cascade, on_delete: :nullify
  add_foreign_key "user_skp", "addon_gol", column: "gol", primary_key: "ID", name: "user_skp_ibfk_12", on_update: :cascade
  add_foreign_key "user_skp", "addon_gol", column: "gol_ap", primary_key: "ID", name: "user_skp_ibfk_4", on_update: :cascade
  add_foreign_key "user_skp", "addon_gol", column: "gol_p", primary_key: "ID", name: "user_skp_ibfk_19", on_update: :cascade
  add_foreign_key "user_skp", "bagian", column: "bag", name: "user_skp_ibfk_7", on_update: :cascade
  add_foreign_key "user_skp", "bagian", column: "bag_2", name: "user_skp_ibfk_9", on_update: :cascade
  add_foreign_key "user_skp", "bagian", column: "bag_ap", name: "user_skp_ibfk_14", on_update: :cascade
  add_foreign_key "user_skp", "bagian", column: "bag_p", name: "user_skp_ibfk_11", on_update: :cascade
  add_foreign_key "user_skp", "bidang", column: "uk", primary_key: "ID", name: "user_skp_ibfk_17", on_update: :cascade
  add_foreign_key "user_skp", "bidang", column: "uk_2", primary_key: "ID", name: "user_skp_ibfk_2", on_update: :cascade
  add_foreign_key "user_skp", "bidang", column: "uk_ap", primary_key: "ID", name: "user_skp_ibfk_6", on_update: :cascade
  add_foreign_key "user_skp", "bidang", column: "uk_p", primary_key: "ID", name: "user_skp_ibfk_21", on_update: :cascade
  add_foreign_key "user_skp", "jabatan", column: "jab", primary_key: "ID", name: "user_skp_ibfk_16", on_update: :cascade
  add_foreign_key "user_skp", "jabatan", column: "jab_2", primary_key: "ID", name: "user_skp_ibfk_22", on_update: :cascade
  add_foreign_key "user_skp", "jabatan", column: "jab_ap", primary_key: "ID", name: "user_skp_ibfk_5", on_update: :cascade
  add_foreign_key "user_skp", "jabatan", column: "jab_p", primary_key: "ID", name: "user_skp_ibfk_20", on_update: :cascade
  add_foreign_key "user_skp", "subbagian", column: "sbag", name: "user_skp_ibfk_8", on_update: :cascade
  add_foreign_key "user_skp", "subbagian", column: "sbag_2", name: "user_skp_ibfk_10", on_update: :cascade
  add_foreign_key "user_skp", "subbagian", column: "sbag_ap", name: "user_skp_ibfk_15", on_update: :cascade
  add_foreign_key "user_skp", "subbagian", column: "sbag_p", name: "user_skp_ibfk_13", on_update: :cascade
  add_foreign_key "user_skp", "user", column: "uid", primary_key: "ID", name: "user_skp_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_skp", "user", column: "uid_ap", primary_key: "ID", name: "user_skp_ibfk_3", on_update: :cascade
  add_foreign_key "user_skp", "user", column: "uid_p", primary_key: "ID", name: "user_skp_ibfk_18", on_update: :cascade
  add_foreign_key "user_skp_adj", "user", column: "uid", primary_key: "ID", name: "user_skp_adj_ibfk_1", on_update: :cascade
  add_foreign_key "user_skp_adj", "user_skp", column: "id_skp", name: "user_skp_adj_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_skp_adj", "user_skp_kontrak", column: "id_kontrak", name: "user_skp_adj_ibfk_3", on_update: :cascade, on_delete: :nullify
  add_foreign_key "user_skp_attitude", "user", column: "uid", primary_key: "ID", name: "user_skp_attitude_ibfk_1", on_update: :cascade
  add_foreign_key "user_skp_attitude", "user_skp", column: "id_skp", name: "user_skp_attitude_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_skp_kerja", "user", column: "uid", primary_key: "ID", name: "user_skp_kerja_ibfk_1", on_update: :cascade
  add_foreign_key "user_skp_kerja", "user", column: "uid_p", primary_key: "ID", name: "user_skp_kerja_ibfk_3", on_update: :cascade
  add_foreign_key "user_skp_kerja", "user_skp", column: "id_skp", name: "user_skp_kerja_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_skp_kerja_n", "user", column: "uid", primary_key: "ID", name: "user_skp_kerja_n_ibfk_2", on_update: :cascade
  add_foreign_key "user_skp_kerja_n", "user", column: "uid_p", primary_key: "ID", name: "user_skp_kerja_n_ibfk_4", on_update: :cascade
  add_foreign_key "user_skp_kerja_n", "user_skp", column: "id_skp", name: "user_skp_kerja_n_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_skp_kerja_n", "user_skp_kerja", column: "id_kerja", name: "user_skp_kerja_n_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_skp_kontrak", "skp_satuan", column: "satuan", name: "user_skp_kontrak_ibfk_3", on_update: :cascade
  add_foreign_key "user_skp_kontrak", "user", column: "uid", primary_key: "ID", name: "user_skp_kontrak_ibfk_1", on_update: :cascade
  add_foreign_key "user_skp_kontrak", "user_skp", column: "id_skp", name: "user_skp_kontrak_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_skp_kreatif", "user", column: "uid", primary_key: "ID", name: "user_skp_kreatif_ibfk_1", on_update: :cascade
  add_foreign_key "user_skp_kreatif", "user", column: "uid_p", primary_key: "ID", name: "user_skp_kreatif_ibfk_3", on_update: :cascade
  add_foreign_key "user_skp_kreatif", "user_skp", column: "id_skp", name: "user_skp_kreatif_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_skp_lamu", "user", column: "uid", primary_key: "ID", name: "user_skp_lamu_ibfk_2", on_update: :cascade
  add_foreign_key "user_skp_lamu", "user_skp", column: "id_skp", name: "user_skp_lamu_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_skp_nilai", "user", column: "uid_p", primary_key: "ID", name: "user_skp_nilai_ibfk_2", on_update: :cascade
  add_foreign_key "user_skp_nilai", "user_skp", column: "id_skp", name: "user_skp_nilai_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_skp_nlog", "user_skp", column: "id_skp", name: "user_skp_nlog_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_skp_nlog", "user_skp", column: "uid", primary_key: "uid", name: "user_skp_nlog_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_skp_plog", "addon_gol", column: "gol_p", primary_key: "ID", name: "user_skp_plog_ibfk_3", on_update: :cascade
  add_foreign_key "user_skp_plog", "bagian", column: "bag_p", name: "user_skp_plog_ibfk_6", on_update: :cascade
  add_foreign_key "user_skp_plog", "bidang", column: "uk_p", primary_key: "ID", name: "user_skp_plog_ibfk_5", on_update: :cascade
  add_foreign_key "user_skp_plog", "jabatan", column: "jab_p", primary_key: "ID", name: "user_skp_plog_ibfk_4", on_update: :cascade
  add_foreign_key "user_skp_plog", "subbagian", column: "sbag_p", name: "user_skp_plog_ibfk_7", on_update: :cascade
  add_foreign_key "user_skp_plog", "user", column: "uid_p", primary_key: "ID", name: "user_skp_plog_ibfk_2", on_update: :cascade
  add_foreign_key "user_skp_plog", "user_skp", column: "id_skp", name: "user_skp_plog_ibfk_1", on_update: :cascade, on_delete: :cascade
end
