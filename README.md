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


# アプリケーション名
フリマアプリ

# アプリケーション概要
メルカリのクローンサイトです。
商品の出品と表示、購入をすることができます。

# URL
https://furima-33991.herokuapp.com/

# テスト用アカウント
メールアドレス：t@t
<br>パスワード：ttt111
<br>Basic認証 ユーザー名：admin
<br>Basic認証 パスワード：2222

# 利用方法
- 出品及び購入機能を使用したいユーザーは新規登録をしてください（閲覧のみであれば登録不要）。
- ユーザー登録をしたユーザーは、入力フォームに従い必要事項を記入すれば出品できます。
- トップページ：出品された商品一覧が閲覧できます。
- 商品詳細ページ：出品された商品の詳細情報を見ることができます。
- 購入ページ：入力フォームに従い必要事項を入力すると、クレジットカード決済で商品を購入することができます。

# 目指した問題解決
メルカリのクローンサイトを実装しました。

# 洗い出した要件 
- ユーザー管理機能
- 新規出品機能
- 商品一覧表示機能
- 商品詳細表示機能
- 商品購入機能

# 実装した機能についてのGIFと説明
## トップページの説明
![demo](https://gyazo.com/2a7bc7fa896740a6d6c7dc95a531f59e/raw)
トップページには出品された商品が一覧表示されています。
</br>商品をクリックすると商品詳細情報ページに遷移することができます。
</br>出品したユーザーは商品情報の編集削除ができます。出品者以外であれば商品購入ボタンが表示されます。

## 各都道府県別一覧ページの説明
![demo](https://gyazo.com/3a057893f387ed1d393d355bae38098e/raw)
出品者以外のユーザーは商品詳細ページから購入画面に遷移できます。
</br>入力フォームの必要事項を入力すれば商品を購入することができます。

# データベース設計
![demo](https://gyazo.com/68f97b4ab6bba6244eb8a2b1b9ada481/raw)

# ローカルでの動作方法
https://github.com/Yurika-1016/furima-33991.git
<br>ruby version '2.6.5'
<br>Ruby on Rails

## usersテーブル
|      Column      |   type   |                           Options                                |
| ---------------- | -------- | ---------------------------------------------------------------- |
|    family_name   |  string  |      null:false, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}       |
|    first_name    |  string  |      null:false, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}       |
|    family_kana   |  string  |            null:false, format: { with: /\A[ァ-ンー]+\z/}          |
|    first_kana    |  string  |            null:false, format: { with: /\A[ァ-ン一]+\z/}          |
|    nickname      |  string  |                           null:false                             |
|      email       |  string  |                           null:false                             |
|encrypted_password|  string  |   null:false, unique: true, format: { with:/[a-z\d]{8,}/i }      |
|     birthday     |   date   |                           null:false                             |
### Association
- has_many :items
- has_many :orders


## itemsテーブル
|     Column     |     type     |                 Options             |
| -------------- | ------------ | ----------------------------------- |
|      name      |    string    |               null:false            |
|    content     |     text     |               null:false            |
|   category_id  |    integer   |               null:false            |
| item_status_id |    integer   |               null:false            |
| delivery_fee_id|    integer   |               null:false            |
|shipping_area_id|    integer   |               null:false            |
|shipping_days_id|    integer   |               null:false            |
|     price      |    integer   |  null:false, format: {/[\d]{3,7}/}  |
|      user      |  references  |      null:false, foreign_keys:true  |
### Association
- belongs_to :user
- has_one :order

## addressテーブル
|    Column    |     type     |                     Options                           |
| ------------ | ------------ | ----------------------------------------------------- |
|  postal_code |    string    |    null:false, format: { with: /\A\d{3}[-]\d{4}\z/ }  |
| prefecture_id|    integer   |                     null:false                        |
|     city     |    string    |                     null:false                        |
|    address   |    string    |                     null:false                        |
|   building   |    string    |                                                       |
| phone_number |    string    |            null:false, format: {/[\d]{11}/ }          |
|    order     |  references  |            null:false, foreign_keys:true              |
### Association    
- belongs_to :order

## ordersテーブル
|     item     |  references  |            null:false, foreign_keys:true              |
|     user     |  references  |            null:false, foreign_keys:true              | 
### Association
- belongs_to :user
- belongs_to :item
- has_one :address