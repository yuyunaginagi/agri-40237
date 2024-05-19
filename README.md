アプリケーション名
--------------------------------------------------------------
AGRI MASTER

アプリケーション概要
--------------------------------------------------------------
高校で農業を指導する教員が、教材および問題を投稿し、共有することができる。

URL
--------------------------------------------------------------


テスト用アカウント
--------------------------------------------------------------
・Basic認証ID：admin  
・Basic認証パスワード：3333  
・メールアドレス：test@test  
・パスワード：123456

利用方法
--------------------------------------------------------------

### 科目登録
1.トップページからユーザー新規登録もしくはログインをする  
2.科目登録ボタンから、科目名を入力し投稿する

### 教材投稿
1.教材投稿ボタンをクリックして、教材を投稿する。

### 問題投稿
1.問題投稿ボタンをクリックして、問題を投稿する。  

### 質問投稿
1.投稿された教材および問題に関わる質問とその回答ができる。

アプリケーションを作成した背景
--------------------------------------------------------------
教員は各々が用意した教材を用いて授業を進めているが、他の教員の授業や実習の教材というのは共有されにくいという現状がある。  
考査問題などにおいても１から作ると大変な作業である。また、農業といった教科は専門分野になるため、世の中に存在する資料が限られている。  
このことから、教員が作成した教材データのアップロードができ、他の教員が閲覧およびダウンロードできるツールが必要であると考え、アプリケーション開発に至った。  

洗い出した要件
--------------------------------------------------------------
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1RtuHqbQ8R75Zn82PvKZot4XkTIjA3YRuHTaupxd1Gzc/edit#gid=982722306)


実装した機能についての画像やGIFおよびその説明
--------------------------------------------------------------
[ログイン(動画)](https://gyazo.com/dfb1a37ca3c8ffa2271b6bd147d18190)  
[新規登録(動画)](https://gyazo.com/fab0e13e210b48da257101e982744299)  
[競技結果投稿(動画)](https://gyazo.com/08a020c54d07e9dec6b29b86f9f15b81)  
[競技結果削除（動画）](https://gyazo.com/847c64fef18ae9760f830e253d0350c4)  
[振り返り投稿(動画)](https://gyazo.com/ed945f92d9e4459db8d5a233957f4a28)  
[振り返り削除（動画）](https://gyazo.com/02003e536e08a7690623ceb0b8515fc4)  
[競技結果もしくは振り返りの新規投稿時のNEW!の表示(画像)](https://gyazo.com/38a95e90bf191592191b005c14e4a511)  
[コメント投稿(動画)](https://gyazo.com/05c6cb27b7f21f25da47f0dfb948a1de)  
[いいね(動画)](https://gyazo.com/f10be1fa5c5b06a8deab1d417ac13238)  
[いいねをされたユーザー(画像)](https://gyazo.com/460cf69421fef852ef192cb37fdb3abd)  

データベース設計
--------------------------------------------------------------
[![Image from Gyazo](https://i.gyazo.com/f28ac075a9a51f9398d960a163474330.png)](https://gyazo.com/f28ac075a9a51f9398d960a163474330)


画面遷移図
--------------------------------------------------------------
[![Image from Gyazo](https://i.gyazo.com/737589f9181c7384728de80377bdfb43.png)](https://gyazo.com/737589f9181c7384728de80377bdfb43)

開発環境
--------------------------------------------------------------
・フロントエンド（HTML、CSS、JavaScript）  
・バックエンド（言語：Ruby　フレームワーク：Ruby on Rails）  
・テスト（RSpecによるモデルの単体テスト）  
・テキストエディタ（Visual Studio Code）

ローカルでの動作方法
--------------------------------------------------------------
% git clone https://github.com/yuyunaginagi/agri-40237.git  
% cd agri-40237  
% bundle install  
% yarn install  
% rails db:create  
% rails db:migrate  
% rails s


工夫したポイント
--------------------------------------------------------------
1.  
2.  
3.  
4.


usersテーブル
--------------------------------------------------------------
| Column             | Type    | Options     |
|--------------------|---------|-------------|
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |


### Association
- has_many :subject_users
- has_many :subjects, through: :subject_users
- has_many :teaching_materials
- has_many :exams
- has_many :questions

subjectsテーブル
-------------------------------------------------------------
| Column       | Type       | Options     |
|--------------|------------|-------------|
| user         | references | null: false, foreign_key: true |
| subject_name | string     | null: false |
| image        | image      | null: false |

### Association
- has_many :subject_users
- has_many :users, through: :subject_users
- has_many :teaching_materials
- has_many :exams
- has_many :questions
- has_one _attached :image

subject_usersテーブル
-------------------------------------------------------------
| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| subject | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :subject

teaching_materialsテーブル
-------------------------------------------------------------
| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| subject | references | null: false, foreign_key: true |
| title   | string     | null: false                    |
| files   | string     | null: false                    |

### Association
- belongs_to :user
- belongs_to :subject

examsテーブル
-------------------------------------------------------------
| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| subject | references | null: false, foreign_key: true |
| title   | string     | null: false                    |
| file    | string     | null: false                    |

### Association
- belongs_to :user
- belongs_to :subject

questionsテーブル
-------------------------------------------------------------
| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| user     | references | null: false, foreign_key: true |
| subject  | references | null: false, foreign_key: true |
| title    | string     | null: false                    |
| question | text       | null: false                    |

### Association
- belongs_to :user
- belongs_to :subject