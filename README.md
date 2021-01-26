# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last-name          | string | null: false |
| first-name         | string | null: false |
| last-name-kana     | string | null: false |
| first-name-kana    | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :purchases
- has_many :items
- has_many :purchases

## items テーブル

| Column    | Type       | Options       |
| --------- | ---------- | ------------- |
| name      | string     | null: false   |
| text      | text       | null: false   |
| category  | string     | null: false   |
| sales     | string     | null: false   |
| shipping  | string     | null: false   |
| area      | string     | null: false   |
| scheduled | string     | null: false   |
| price     | string     | null: false   |
| user_id   | references |               |

### Association

- has_many :purchases
- has_many :users
- belongs_to :user

## purchases テーブル

| Column | Type       | Options                                      |
| ------ | ---------- | -------------------------------------------- |
| user   | references | null: false, foreign_key: true               |
| item   | references | null: false, unique: true, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal-code  | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| address-line | string     | null: false |
| building     | string     |             |
| phone-number | string     | null: false |
| item_id      | references |             |

### Association

- belongs_to :purchases