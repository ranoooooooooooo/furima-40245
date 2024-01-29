# README

# テーブル設計

## users テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| email                     | string     | null: false, unique: true      |
| encrypted_password        | string     | null: false                    |
| nickname                  | string     | null: false                    |
| last_name                 | string     | null: false                    |
| first_name	              | string     | null: false                    |
| last_name_kana            | string     | null: false                    |
| first_name_kana           | string     | null: false                    |
| birthday                  | date       | null: false                    |

- has_many :items
- has_many :orders


## items テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| item_name                 | string     | null: false                    |
| item_description          | text       | null: false                    |
| item_category_id          | integer    | null: false                    |
| item_status_id            | integer    | null: false                    |
| delivery_fee_bearer_id    | integer    | null: false                    |
| prefecture_id             | integer    | null: false                    |
| days_to_ship_id           | integer    | null: false                    |
| price                     | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :order


## orders テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| user                      | references | null: false, foreign_key: true |
| item                      | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| postcode                  | string     | null: false                    |
| prefecture_id             | integer    | null: false                    |
| city                      | string     | null: false                    |
| street                    | string     | null: false                    |
| building                  | string     |                                |
| phone_number              | string     | null: false                    |
| order                     | references | null: false, foreign_key: true |

- belongs_to :order