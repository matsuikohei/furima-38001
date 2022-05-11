# テーブル設計

## usersテーブル

| Column    | Type   | Options                   |
| --------- | ------ | ------------------------- |
| nickname  | string | null: false               |
| email     | string | null: false, unique: true |
| password  | string | null: false               |
| name      | string | null: false               |
| kana_name | string | null: false               |
| birthday  | date   | null: false               |

### Association

 - has_many :items
 - has_many :sold_items

## itemsテーブル

| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| name      | string  | null: false                    |
| text      | string  | null: false                    |
| category  | string  | null: false                    |
| condition | string  | null: false                    |
| charge    | string  | null: false                    |
| area      | string  | null: false                    |
| days      | string  | null: false                    |
| price     | integer | null: false                    |
| user_id   | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :sold_item

## sold_items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippingsテーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| postal       | string  | null: false                    |
| prefecture   | string  | null: false                    |
| city         | string  | null: false                    |
| address      | string  | null: false                    |
| building     | string  |                                |
| phone        | integer | null: false                    |
| sold_item_id | integer | null: false, foreign_key: true |

### Association

-belongs_to :sold_item