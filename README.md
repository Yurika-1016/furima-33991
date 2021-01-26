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
|      Column      |   type   |                           Options                                |
| ---------------- | -------- | ---------------------------------------------------------------- |
|    family_name   |  string  |      null:false, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}       |
|    first_name    |  string  |      null:false, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}       |
|    family_kana   |  string  |            null:false, format: { with: /\A[ァ-ンー]+\z/}          |
|    first_kana    |  string  |            null:false, format: { with: /\A[ァ-ン一]+\z/}          |
|      email       |  string  |                           null:false                             |
|encrypted_password|  string  |              null:false, format: { with:/[a-z\d]{8,}/i }         |
|     birthday     |   date   |                           null:false                             |

## itemsテーブル
|     Column     |     type     |                 Options             |
| -------------- | ------------ | ----------------------------------- |
|      name      |    string    |               null:false            |
|    content     |     text     |               null:false            |
|   category_id  |    integer   |               null:false            |
| item_status_id |    integer   |               null:false            |
| delivery_fee_id|    integer   |               null:false            |
|shipping-area_id|    integer   |               null:false            |
|shipping-days_id|    integer   |               null:false            |
|     price      |    integer   |  null:false, format: {/[\d]{3,7}/}  |
|      user      |  references  |      null:false, foreign_keys:true  |

## addressテーブル
|    Column    |     type     |                     Options                           |
| ------------ | ------------ | ----------------------------------------------------- |
|  postal_code |    string    |    null:false, format: { with: /\A\d{3}[-]\d{4}\z/ }  |
|  prefecture  |    string    |                     null:false                        |
|     city     |    string    |                     null:false                        |
|    address   |    string    |                     null:false                        |
|   building   |    string    |                     null:false                        |
| phone_number |    string    |            null:false, format: {/[\d]{11}/ }          |

## ordersテーブル
|     item     |  references  |            null:false, foreign_keys:true              |
|     user     |  references  |            null:false, foreign_keys:true              | 
