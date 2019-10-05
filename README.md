# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# TheBestCup DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
### Association
- has_many :stores

## storesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|visit_day|date|null: false|
|image|text|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :products


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|int||
|taste|string|null: false|
|memo|text||
|store_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|image_id|references|null: false, foreign_key: true|
### Association
- belongs_to :product
- belongs_to :user
