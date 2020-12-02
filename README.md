# DB設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| first-name      | string | null: false |
| last-name       | string | null: false |
| first-name-kana | string | null: false |
| last-name-kana  | string | null: false |
| email           | string | null: false |
| nick-name       | string | null: false |
| birthday        | date   | null: false |
| encrypted-password | string | null: false |

### Association

- has_many :items

## items テーブル

| Column       | Type    | Options     |
| --------     | ------  | ----------- |
| item-name    | string  | null: false |
| category-id  | integer | null: false |
| price        | numeric | null: false |
| seller       | text    | null: false |
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
- has_one :shipping-addresses

## shipping-addresses

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| postal-code_id  | integer | null: false |
| prefectures_id  | integer | null: false |
| municipality_id | integer | null: false |
| address_id      | integer | null: false |
| building-name_id | integer |             |
| phone-number_id  | integer | null: false |

### Association

-belongs_to purchases