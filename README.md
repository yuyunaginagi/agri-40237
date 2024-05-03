アプリケーション名
--------------------------------------------------------------
AGRI MASTER

アプリケーション概要
--------------------------------------------------------------
高校で農業を指導する教員が、教材および考査問題を投稿し、共有することができる。

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

### 考査問題投稿
1.考査問題投稿ボタンをクリックして、考査問題を投稿する。  
2.

アプリケーションを作成した背景
--------------------------------------------------------------
陸上競技において、競技結果（記録）の管理は、チームおよび個人において重要である。また、各種試合の申し込みにも必要な情報である。試合の記録をその都度残しておかないと、自己ベストの記録を調べることが大変であり、記録の仕方は統一されていないという課題がある。
さらに、競技に取り組む上で、試合や練習の振り返りが重要である。指導者が選手とやり取りするツールも必要であると考え、アプリケーション開発に至った。

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
% git clone https://github.com/yuyunaginagi/original-40237.git  
% cd original-40237  
% bundle install  
% yarn install  
% rails db:create  
% rails db:migrate  
% rails s


工夫したポイント
--------------------------------------------------------------
1.見やすさを意識し、ログイン後は登録されたユーザー名のみが表示されるようにした。ユーザー名をクリックすると各ユーザーの詳細ページに遷移するようにした。  
2.投稿に対して、誤った削除が起こらないよう、削除ボタンを押した際は、確認ダイアログが表示されるようにした。  
3.誰が最近投稿したかわかるように、12時間以内の投稿があれば、ユーザー一覧ページに「NEW!」と表示されるようにした。  
4.ユーザーのほとんどが学生であるため、スマホでの見やすさにこだわった。PC用とスマホ用でビューを変化させた。


usersテーブル
--------------------------------------------------------------
| Column              | Type    | Options     |
|---------------------|---------|-------------|
| nickname            | string  | null: false |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false |
| birth_day           | date    | null: false |
| event               | string  | null: false |
| goal                | string  | null: false |


### Association
- has_many :results
- has_many :reviews
- has_many :comments
- has_many :likes

resultsテーブル
-------------------------------------------------------------
| Column                 | Type       | Options     |
|------------------------|------------|-------------|
| user                   | references | null: false, foreign_key: true |
| date                   | date       | null: false |
| game_name              | string     | null: false |
| event_id               | integer    | null: false |
| result                 | text       | null: false |

### Association
- belongs_to :user

reviewsテーブル
-------------------------------------------------------------
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| user             | references | null: false, foreign_key: true |
| date             | date       | null: false                    |
| activity         | string     | null: false                    |
| review           | text       | null: false                    |

### Association
- belongs_to :user
- has_many :comments
- has_many :likes

commentsテーブル
-------------------------------------------------------------
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| text             | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| review           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :review

likesテーブル
--------------------------------------------------------------
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| like             | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| review           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :review