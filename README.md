# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :purchases
- has_many :items

## items テーブル

| Column    | Type       | Options       |
| --------- | ---------- | ------------- |
| name      | string     | null: false   |
| text      | text       | null: false   |
| category  | integer    | null: false   |
| sales     | integer    | null: false   |
| shipping  | integer    | null: false   |
| area      | integer    | null: false   |
| scheduled | integer    | null: false   |
| price     | integer    | null: false   |
| user      | references |               |

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
| postal_code  | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| address_line | string     | null: false |
| building     | string     |             |
| phone_number | string     | null: false |
| item         | references |             |

### Association

- belongs_to :purchase