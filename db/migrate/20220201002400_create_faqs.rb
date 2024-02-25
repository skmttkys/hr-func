class CreateFaqs < ActiveRecord::Migration[7.0]
  def change
    create_table "faqs", comment: "FAQ", force: :cascade do |t|
      t.string "faq_word", null: false, comment: "タイトル・見出し"
      t.string "answer", comment: "ファイル名"
      t.string "tags", comment: "タグ", array: true
      t.bigint "order_no", comment: "表示順序"
      t.boolean "is_topfive", comment: "TOP5フラグ"
      t.bigint "show_manual_number", comment: "マニュアル番号", array: true
    end
  end
end