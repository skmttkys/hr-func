class CreateManuals < ActiveRecord::Migration[7.0]
  def change
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
  end
end
