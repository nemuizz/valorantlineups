[![Image from Gyazo](https://i.gyazo.com/ec1a565e13d484a005dc0071e5f80c4b.jpg)](https://gyazo.com/ec1a565e13d484a005dc0071e5f80c4b)

# サービス概要

### サービス名
VALORANT_Lineups  
https://www.valorant-lineups.net

### 概要
VALORANTというゲームの攻略情報を検索、共有するためのサイトです。

# サービスを作成した背景
私自身がこのゲームをプレイしていた経験から、暗記系の攻略情報を素早く検索したり、備忘録として残しておけるようなサイトがあれば便利だと思い、作成しました。

# 使い方
ホーム画面から選択したキャラクター、マップ、入力したフリーワードから検索を行うことができます。  
ログインをすることで投稿機能、いいね機能が使用できます。




# 使用技術
* Ruby 3.2.2
* Ruby on Rails 7.0.4.3
* Mysql 8.0.33
* Nginx
* Puma
* AWS
	* VPC
	* EC2
	* RDS
	* Route53
	* S3
* RSpec
* Twitter API


# 機能一覧
| 機能 | 使用jem等 |
|:----:|:---------:|
| ユーザー登録、ログイン機能 | devise, twitter api(amniouth) |
| 画像付き投稿機能 | activestorage |
| いいね機能(非同期) | turbo stream |
| ページネーション | kaminari |
| 検索機能 | ransack |
| ソート機能 | ransack |

#テスト
* RSpec
	* 単体テスト(model spec)
	* 統合テスト(system spec)


# ER図
[![Image from Gyazo](https://i.gyazo.com/165c6b472e473888281f8af9091b7afd.png)](https://gyazo.com/165c6b472e473888281f8af9091b7afd)

# 工夫点
[![Image from Gyazo](https://i.gyazo.com/6a23b32d70e1face140dba7aefce3ee6.gif)](https://gyazo.com/6a23b32d70e1face140dba7aefce3ee6)

###  1.ホーム画面からログイン不要で検索を行うことができるようにフォームを設置しています。ゲームプレイ中にも簡単に検索ができます。
###  2.検索フォームにはチェックボックスやラジオボタンではなく、画像アイコンを使用することでより直感的な操作を実現しました。


# 今後の展望・追加機能について
現状、フロントエンドをbootstrapに頼り切ってしまっているので、JavaScriptなど、フロントの技術も磨いていきたいです。  
インフラ側では、システムの冗長化やCI/CDなど、より実用的な技術の習得、実践を目指します。