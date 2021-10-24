game = Category.create(name: 'ゲーム')
 action, kakutou, puzzle, moba = game.children.create(
  [
    { name: 'アクション・FPS・TPS' },
    { name: '格闘・スポーツ・レース' },
    { name: 'パズル・カード・サバイバル' },
    { name: 'MOBA・シューティング' }
  ]
)

['Apex Lengends（PC版）', 'Apex Lengends（PS・Switch版）', 'Overwatch', 'Rainbim Six Siege', 'VALORANT', 'スプラトゥーン', 'World of Tanks', 'World of Warships', 'ハイパースケープ', '荒野行動', 'Fortnite', '大乱闘スマッシュブラザーズ', 'Battlefield V', 'Call of Duty', 'CS:GO'].each do |name|
  action.children.create(name: name)
end

['ロケットリーグ', 'ストリートファイター', 'ウイイレ', 'グランブルーファンタジーヴァーサス', 'グランツーリスモ'].each do |name|
  kakutou.children.create(name: name)
end

['Dead by Daylight', '第五人格（Identity）', 'テトリス（TETRIS）', 'Shadowverse', 'Heartstone', 'MTG ARENA', 'ぷよぷよ', 'ドラゴンクエストライバルズ', 'レジェンド・オブ・ルーンテラ'].each do |name|
  puzzle.children.create(name: name)
end

['LOL（League of Legends）', 'ポケモンユナイト', 'クラッシュ・ロワイヤル', 'AutoChess', '東方プロジェクト', 'ブロスタ' 'コンパス', 'モバイルレジェンド', '伝説対決（Arena of Valor）', 'TFT'].each do |name|
  moba.children.create(name: name)
end

creator = Category.create(name: 'クリエイター')
ｍovie, illustration = creator.children.create(
  [
    { name: '動画作成・編集' },
    { name: 'イラスト作成・編集' },
  ]
)

other = Category.create(name: 'その他')
ｍovie, illustration = other.children.create(
  [
    { name: 'コーチ育成' },
    { name: '実況解説・大会運営' },
    { name: 'その他' },
  ]
)