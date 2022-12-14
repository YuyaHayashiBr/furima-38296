module ValidationDefinition
  # 数値
  MAX_NAME_LENGTH   = 40      # 商品名の最大文字数
  MAX_DETAIL_LENGTH = 1000    # 商品説明の最大文字数
  BLANK_MENU        = 0       # プルダウンメニュー: '---'
  MIN_PRICE         = 300     # 設定可能な最低販売価格
  MAX_PRICE         = 9999999 # 設定可能な最高販売価格

  # 正規表現
  POSTCODE_REGEX    = /\A[0-9]{3}-[0-9]{4}\z/ # 郵便番号
  PHONENUMBER_REGEX = /\A\d{10,11}\z/         # 電話番号
end