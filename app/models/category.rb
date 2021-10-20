class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'アクション・FPS・TPS' },
    { id: 3, name: '格闘・スポーツ・レース' },
    { id: 4, name: 'パズル・カード・サバイバル' },
    { id: 5, name: 'MOBA・シューティング' },
    { id: 6, name: 'クリエイター(小説・イラスト・動画)' },
    { id: 7, name: 'コーチ育成' },
    { id: 8, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :recruitments
  end