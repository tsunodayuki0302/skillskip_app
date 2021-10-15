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
