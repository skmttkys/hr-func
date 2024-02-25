class Post < ApplicationRecord
    # 半角カタカナのみ登録可能にする
    VALID_ID_REGEX = /\A[ｧ-ﾝﾞﾟ]+\z/
    validates :uuid, presence: true, format: { with: VALID_ID_REGEX }
    validates :content, presence: true, format: { with: VALID_ID_REGEX }
end
