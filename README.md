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
- has_many :purchases

## items テーブル

| Column  | Type       | Options       |
| ------- | ---------- | ------------- |
| name    | string     | null: false   |
| text    | text       | null: false   |
| image   |            | ActiveStorage |
| user_id | references |               |

### Association

- has_many :purchases
- has_many :users, through: purchases
- has_many :purchases
- belongs_to :user

## purchases テーブル

| Column | Type       | Options                                      |
| ------ | ---------- | -------------------------------------------- |
| user   | references | null: false, foreign_key: true               |
| item   | references | null: false, unique: true, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :address

## address テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal-code  | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| address-line | string     | null: false |
| building     | string     | null: false |
| phone-number | string     | null: false |

### Association

- belongs_to :purchases