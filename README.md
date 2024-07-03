## アプリケーション名

AGRI MASTER

## アプリケーション概要

高校で農業を指導する教員が、教材および問題を投稿し、共有することができる。

## URL

## テスト用アカウント

・Basic 認証 ID：admin  
・Basic 認証パスワード：3333  
・メールアドレス：test@test  
・パスワード：123456

## 利用方法

### 科目登録

1.トップページからユーザー新規登録もしくはログインをする  
2.科目登録ボタンから、科目名を入力し投稿する

### 教材投稿

1.教材投稿ボタンをクリックして、教材を投稿する。

### 問題投稿

1.問題投稿ボタンをクリックして、問題を投稿する。

### 質問投稿

1.投稿された教材および問題に関わる質問とその回答ができる。

## アプリケーションを作成した背景

教員は各々が用意した教材を用いて授業を進めているが、他の教員の授業や実習の教材というのは共有されにくいという現状がある。  
考査問題などにおいても１から作ると大変な作業である。また、農業といった教科は専門分野になるため、世の中に存在する資料が限られている。  
このことから、教員が作成した教材データのアップロードができ、他の教員が閲覧およびダウンロードできるツールが必要であると考え、アプリケーション開発に至った。

## 洗い出した要件

## 実装した機能についての画像や GIF およびその説明

## データベース設計

## 画面遷移図

## 開発環境

・フロントエンド（HTML、CSS、JavaScript）  
・バックエンド（言語：Ruby 　フレームワーク：Ruby on Rails）  
・テスト（RSpec によるモデルの単体テスト）  
・テキストエディタ（Visual Studio Code）

## ローカルでの動作方法

% git clone https://github.com/yuyunaginagi/agri-40237.git  
% cd agri-40237  
% bundle install  
% yarn install  
% rails db:create  
% rails db:migrate  
% rails s

## 工夫したポイント

1.
2.
3.
4.

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :subject_users
- has_many :subjects, through: :subject_users
- has_many :teaching_materials
- has_many :exams
- has_many :questions

## subjects テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| subject_name | string     | null: false                    |
| image        | image      | null: false                    |

### Association

- has_many :subject_users
- has_many :users, through: :subject_users
- has_many :teaching_materials
- has_many :exams
- has_many :questions
- has_one \_attached :image

## subject_users テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| subject | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :subject

## teaching_materials テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| subject | references | null: false, foreign_key: true |
| title   | string     | null: false                    |
| files   | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :subject

## exams テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| subject | references | null: false, foreign_key: true |
| title   | string     | null: false                    |
| file    | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :subject

## questions テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| subject  | references | null: false, foreign_key: true |
| question | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :subject
