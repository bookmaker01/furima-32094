# DB設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_one :items

## items テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| item-name | string | null: false |
| category  | string | null: false |
| price     | string | null: false |
| seller    | string | null: false |
| status    | string | null: false |
| burden    | string | null: false |
| area      | string | null: false |
| guideline | string | null: false |
| user      | references | foreign_key: true |

### Association

- belongs_to :user

## purchases テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| credit-number   | string | null: false |
| expiration-date | string | null: false |
| security-code   | string | null: false |

### Association

- belongs_to :shipping-addresses

## shipping-addresses

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| postal-code  | string | null: false |
| prefectures  | string | null: false |
| municipality | string | null: false |
| address      | string | null: false |
| building-name| string |             |
| phone-number | string | null: false |

### Association

- belongs_to :purchases