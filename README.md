# テーブル設計

## users table

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

## users association

- has_many prototypes
- has_many comments

## prototypes table

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| title      | string     | null: false                   |
| catch_copy | text       | null: false                   |
| concept    | text       | null: false                   |
| image      |            | ActiveStorage                 |
| user       | references | null: false, foreign_key true |

## prototypes association

- belongs_to users
- has_many comments

## comments table

| Column    | Type       | Option                        |
| --------- | ---------- | ----------------------------- |
| text      | test       | null: false                   |
| user      | references | null: false, foreign_key ture |
| prototype | references | null: false, foreign_key ture |

## comments association

- belongs_to users
- belongs_to prototypes
