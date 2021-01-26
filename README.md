# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :purchases
- has_many :items, through: purchases
- has_many :messages

## items テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| name    | string | null: false |
| image   | string | null: false |
| text    | string | null: false |
| user_id | string | null: false |

### Association

- has_many :purchases
- has_many :users, through: purchases
- has_many :address
- belongs_to :user

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :address

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases