# DB設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| email           | string | null: false |
| nickname       | string | null: false |
| birthday        | date   | null: false |
| encrypted-password | string | null: false |

### Association

- has_many :items

## items テーブル

| Column       | Type    | Options     |
| --------     | ------  | ----------- |
| item_name    | string  | null: false |
| category_id  | integer | null: false |
| price        | integer | null: false |
| status_id    | integer | null: false |
| burden_id    | integer | null: false |
| area_id      | integer | null: false |
| guideline_id | integer | null: false |
| user         | references | foreign_key: true |

### Association

- belongs_to :user

## purchases

| Column       | Type       | Options     |
| ------------ | ------     | ----------- |
| item         | references | null: false foreign_key: true|
| user         | references | null: false foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_many :shipping-addresses

## shipping-addresses

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| postal_code     | string  | null: false |
| prefectures_id  | integer | null: false |
| municipality    | string  | null: false |
| address         | string  | null: false |
| building_name   | string  |             |
| phone_number    | numeric  | null: false |
| purchase        | references|null: false foreign_key: true|
### Association

-belongs_to purchases