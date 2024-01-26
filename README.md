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


## items テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| item_name                 | string     | null: false                    |
| item_description          | text       | null: false                    |
| item_category             | integer    | null: false                    |
| item_status               | integer    | null: false                    |
| delivery_fee_bearer       | integer    | null: false                    |
| shipping_origin           | integer    | null: false                    |
| days_to_ship              | integer    | null: false                    |
| price                     | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |
| order                     | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :order


## orders テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| credit_card_number        | string     | null: false                    |
| credit_card_expiry        | date       | null: false                    |
| credit_card_security_code | string     | null: false                    |
| postcode                  | string     | null: false                    |
| prefecture                | integer    | null: false                    |
| city                      | string     | null: false                    |
| street                    | string     | null: false                    |
| building                  | string     | null: false                    |
| phone_number              | string     | null: false                    |

- has_many :items