# アプリケーション名
SkillSkip

# アプリケーション概要
ゲームの生徒募集と購入。

# URL
https://git.heroku.com/skill-skip-36887.git


# テスト用アカウント
ログインID/pass 
aaa@gmail.com/aaa111

# 利用方法
新規登録・ログイン
新規募集

# 目指した課題解決
コーチが募集することで購入した生徒をコーチングできる。
ゲームの腕に自信がない人を短期間でうまくすることができる。

# 洗い出した要件

| 機能 |  目的  | 詳細 |ストーリー |
| ------------------ | ---------------------- | ------------------------- | ---------------|
| ユーザー管理機能 | ユーザーアカウントを作成。 | 新規登録はID情報、gmail、パスワード、マイページを記載する。ログインはID情報とパスワード、またはgmailとパスワードを入力でログインできる。  | ログインしていないことが前提。トップページから登録できるようにする。登録後は新規登録とログインは消すようにする。 |
| マイページ | 自分のアカウント編集ができる。 | マイページの編集、更新できる。 | ログインしていることが前提。ヘッダーから飛ぶことができる。名前、ID、プロフィールの変更(そのアカウントにログインしているユーザーに限る)。プロフィール、案件受付、レビューなど見ることができる。受講日のカレンダーなども加えたい。 |
| トップページ | 募集版一覧を見ることができる。投稿もできる。 | ヘッダーは検索機能とマイページの移動。フッターに募集版、コミュニティ、通知、ＤＭを行き来できるようにする。 | ログインしていない状態だとヘッダーにログイン、新規登録が表示。ログインしているとマイページとログアウトが表示。募集版、通知、コミュニティに遷移可能。カテゴリーからどのゲームか選択できる。 |
| 募集版 | 詳細から募集版にコメントできる。 | 募集版の一番下にコメントできる。 | カテゴリー＞ゲーム名を選択して、画像とタイトル、テキストを加えて投稿可能。コメントもできる。投稿したら募集版のトップページに飛ばされる。 |
| 購入機能 | PAY.JPを利用した購入機能。 | クレジットカードが決済できる。 | 募集版の購入から遷移できる。クレジット払い。 |
| DM | ユーザー同士でダイレクトメッセージができる。 | ユーザー同士がダイレクトメッセージで会話できる。先生と生徒メインで最初はしようと思います。 | ダイレクトメッセージトップは会話の最後が表示される。新しい通知は見た目でわかりやすくする。押したらメッセージに遷移する。 |


# 実装した機能についての画像やGIFおよびその説明
## ユーザー管理機能
![f0569f8dfbe76203d09c8abd0164ca39](https://user-images.githubusercontent.com/89972275/140509830-6897210b-4250-4622-bc5d-467f326a66e9.gif)
## 新規投稿機能
![1a4d1459d3833784ec017a31350d1d31](https://user-images.githubusercontent.com/89972275/140512138-201c5100-1619-4f52-8571-469aa1e966f9.gif)

# 工夫したポイント
・新規投稿する際、カテゴリーからゲーム名を登録できるようにした。

# 実装予定の機能
・カテゴリー検索機能
・DM機能
・購入機能
・レビュー機能

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| identification     | string | unique: true, null: false |
| nickname           | string | null: false               |
| email              | string | unique: true, null: false |
| encrypted_password | string | null: false               |
| achievement        | string |                           |
| profile            | string | null: false               |


### Association

- has_many :recruitments
- has_many :comments
- has_many :records

## recruitment テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| heading                | string     | null: false                    |
| content                | text       | null: false                    |
| category_id            | integer    | null: false                    |
| price                  | string     | null: false                    |
| user                   | references | null: false, foreign_key: true        |

### Association

- belongs_to :user
- has_many :comment
- has_many :record

## record テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| recruitment   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :recruitment
- has_one :order


## order テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| day                 | string     | null: false                    |
| record              | references | null: false, foreign_key: true |


### Association

- belongs_to :record


## comment テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| letter              | string     | null: false                    |
| user                | references | null: false, foreign_key: true |
| recruitment         | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :recruitment

# 環境環境
・フロントエンド：HTML5/CSS(Bootstrap)/JavaScript/jQuery/Ajax
・バックエンド：Ruby on Rails(6.0.0)/Ruby(2.6.5)/JavaScript
・データベース：MySQL(5.6.50)/Sequel Pro
・インフラ：Heroku
・タスク管理：GitHub