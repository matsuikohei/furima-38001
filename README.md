# テーブル設計

## usersテーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| kana_first_name     | string | null: false               |
| kana_last_name      | string | null: false               |
| birthday            | date   | null: false               |

### Association

 - has_many :items
 - has_many :sold_items

## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| text        | text       | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| charge_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| delivery_id | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :sold_item

## sold_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippingsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| postal    | string     | null: false                    |
| area_id   | integer    | null: false                    |
| city      | string     | null: false                    |
| address   | string     | null: false                    |
| building  | string     |                                |
| phone     | string     | null: false                    |
| sold_item | references | null: false, foreign_key: true |

### Association

-belongs_to :sold_item