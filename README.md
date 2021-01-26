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

## usersテーブル
|   Column   |   type   |                           Options                                |
| ---------- | -------- | ---------------------------------------------------------------- |
| family_name|  string  |      null:false, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}       |
| first_name |  string  |      null:false, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}       |
| family_kana|  string  |            null:false, format: { with: /\A[ァ-ンー]+\z/}          |
| first_kana |  string  |            null:false, format: { with: /\A[ァ-ン一]+\z/}          |
|   email    |  string  |                           null:false                             |
|  password  |  string  |              null:false, format: { with:/[a-z\d]{8,}/i }         |
|  birthday  |  string  |                           null:false                             |

## itemsテーブル
|    Column    |     type     |                 Options             |
| ------------ | ------------ | ----------------------------------- |
|     name     |    string    |               null:false            |
|    image     |    string    |               null:false            |
|   content    |     text     |               null:false            |
|   category   |    string    |               null:false            |
| item_status  |    string    |               null:false            |
| delivery_fee |    integer   |               null:false            |
| shipping-area|    string    |               null:false            |
| shipping-days|    integer   |               null:false            |
|    price     |    integer   |  null:false, format: {/[\d]{3,7}/}  |
|    user_id   |  references  |      null:false, foreign_keys:true  |

## ordersテーブル
|    Column    |     type     |                     Options                           |
| ------------ | ------------ | ----------------------------------------------------- |
|  credit_card |    string    |                     null:false                        |
|  postal_code |    integer   |    null:false, format: { with: /\A\d{3}[-]\d{4}\z/ }  |
|  prefecture  |    string    |                     null:false                        |
|     city     |    string    |                     null:false                        |
|    address   |    string    |                     null:false                        |
| phone_number |    integer   |            null:false, format: {/[\d]{11}/ }          |
|   item_id    |  references  |            null:false, foreign_keys:true              |
|   user_id    |  references  |            null:false, foreign_keys:true              | 