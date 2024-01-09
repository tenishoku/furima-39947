# README

## users

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birth_date            | integer | null: false               |

### Association
- has_many :items
- has_many :orders

## items

| Column                   | Type       | Options                           |
| ------------------------ | ---------- | --------------------------------- |
| item_image               | string     | null: false                       |
| item_name                | string     | null: false                       |
| item_info                | string     | null: false                       |
| item_category            | string     | null: false                       |
| item_sales_status        | string     | null: false                       |
| item_shipping_fee_status | string     | null: false                       |
| item_prefecture          | string     | null: false                       |
| item_scheduled_delivery  | string     | null: false                       |
| item_price               | integer    | null: false                       |
| add_tax_price            | integer    | null: false                       |
| profit                   | integer    | null: false                       |
| user_id                  | references | null: false, foreign_key: true    |

### Association
- belongs_to :user
- has_one :order

## orders

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :order
- has_one :shipping-address

## shipping-address

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     |                                |
| phone_number | integer    | null: false                    |
| order_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :order