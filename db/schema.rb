# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_01_002400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faqs", comment: "FAQ", force: :cascade do |t|
    t.string "faq_word", null: false, comment: "タイトル・見出し"
    t.string "answer", comment: "ファイル名"
    t.string "tags", comment: "タグ", array: true
    t.bigint "order_no", comment: "表示順序"
    t.boolean "is_topfive", comment: "TOP5フラグ"
    t.bigint "show_manual_number", comment: "マニュアル番号", array: true
  end

  create_table "manuals", comment: "マニュアル", force: :cascade do |t|
    t.string "title", null: false, comment: "タイトル・見出し"
    t.string "file_name", comment: "ファイル名"
    t.string "tags", comment: "タグ", array: true
    t.string "func_category", null: false, comment: "機能カテゴリー"
    t.string "using_category", null: false, comment: "利用別カテゴリー"
    t.string "device", null: false, comment: "デバイス"
    t.bigint "order_no", comment: "表示順序"
    t.string "file_label", comment: "ファイル名用ラベル"
    t.string "contents", null: false, comment: "内容"
    t.string "func_sub_category", null: false, comment: "機能サブカテゴリー"
    t.string "using_sub_category", null: false, comment: "利用別サブカテゴリー"
    t.string "use_function", comment: "マニュアル表示機能"
    t.boolean "is_offline", comment: "オフライン用"
    t.string "base_file_name", comment: "元ファイル名"
    t.bigint "manual_number", comment: "マニュアル番号"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uuid"
  end

  create_table "testdbs", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
