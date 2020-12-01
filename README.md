# DB設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| first-name     | string | null: false |
| last-name      | string | null: false |
| email          | string | null: false |
| encrypted-password | string | null: false |

### Association

- has_one :items

## items テーブル

| Column       | Type    | Options     |
| --------     | ------  | ----------- |
| item-name    | string  | null: false |
| category-id  | integer | null: false |
| price        | numeric | null: false |
| seller       | string  | null: false |
| status_id    | integer | null: false |
| burden_id    | integer | null: false |
| area_id      | integer | null: false |
| guideline_id | integer | null: false |
| user         | references | foreign_key: true |

### Association

- belongs_to :user