# SCIENCE ALLIANCE
<img width="1439" alt="スクリーンショット 2021-06-30 15 15 08" src="https://user-images.githubusercontent.com/77427889/123910866-040a6f00-d9b6-11eb-8ac7-606b12dfa71f.png">  

* 大学院生や大学生など、学生研究者のためのSNSアプリケーションです。

* 情報共有や勉強会、資料の公開など、個人の利用目的に合ったユーザー同士のマッチングが可能です。

# URL

 (https://blogs.alliance-science.com/)

 # 目指した課題解決

 ## 想定される利用者

 * 同じ分野を研究する学生と繋がりを作りたい学生

 * 自分の論文など研究成果を公開したい人

 * 研究を続けるモチベーションを向上したい人

 * 自らの研究成果や研究を引き継いでくれる人を探したい学生

 ## 課題と解決策

| 課題 | 解決策 |
| --- | --- |
| 繋がりを作りたい学生 | 掲示板やダイレクトメッセージを利用する。ユーザーステータスから同じ利用目的の学生を探す。 |
| 研究成果を公開したい学生 | pdfや画像をアップロードし、閲覧とダウンロードが可能 |
| モチベーションを維持したい人 | マイクロポスト機能で、ユーザーの研究活動を知ることができる |
| 研究を引き継いでくれる人を探したい学生 | 掲示板や検索機能を使いユーザーを探す。ユーザーステータスから合致する利用目的の学生を探す。|


## 背景・意図

大学や大学院において修学課題として、学生の多くは研究活動を行います。中でも大学院生の研究は質が高く、研究成果は社会問題を始め、様々な課題の解決につながる有意義な情報を含みます。しかしながら、そのような研究成果の一部は論文として発表されるものの実際の研究成果の多くは学生の卒業とともに埋没し、ロストテクノロジーが生じています。  
また学生が所属する研究室は非常に閉じられたコミュニティです。同じ分野を研究する他大学の学生と連携することは現状困難であり、実験手法や参考となる文献を学生個人で収集している為学生の研究効率は良いとは言えず、さらにコロナ禍がその状況を悪化させています。  
この二点が現在の学生の研究活動における問題点です。  

上記の研究活動における問題点は私自身も大学や大学院での生活で経験しました。この経験を元に学生が同じ目的を持つ学生と繋がることでより有意義に研究活動が行えるようにするため、このサービスを作成しました。サービスを通して、一人で困っていたり悩む学生の数を減らすことができればと思っております。


# 使用技術
## バックエンド
* ruby 2.7.0
* Ruby on Rails 6.1.3.2
* RSpec (テスト)
* Rubocop (コード解析ツール)

## フロントエンド
* HTML/CSS
* Javascript
* Vue.js 2.6.14(掲示板・マイクロポスト・ユーザーステータス)

## インフラ・開発環境
* Git/Github (pull requestを利用)
* Docker/Docker-compose (開発・テスト)
* AWS (EC2/ RDS(MySQL)/ VPC / IAM / Route53 / ACM / ELB /) 
* CircleCI
* MySQL 5.7
* Nginx
* puma

## インフラ構成図
![aws drawio](https://user-images.githubusercontent.com/77427889/123908321-3a45ef80-d9b2-11eb-9553-d3b475216b5f.png)
# 実装した機能

### ユーザー登録(devise)  
* 登録・編集・削除  
* メールアドレス認証(Gmail)  
* ログイン  
* ログアウト

### プロフィール(一部非同期通信)  
* サムネイル画像登録  
* 自己紹介欄  
* 登録地域  
* ユーザーステータス(アプリを使用する目的)の登録・公開(非同期通信)  
* pdf・画像のアップロード  
* 自分が投稿したマイクロポスト・掲示板・pdf・画像の表示/削除  
* ユーザーフォロー機能  
* フォロワー一覧の表示     

### マイクロポスト(非同期通信)  
* 投稿  
* 一覧表示  
* 投稿者による削除  
* いいね機能  
* ページネーション機能(vuejs-paginate)


### 掲示板投稿(非同期通信)  
* 一覧表示  
* 詳細表示(投稿者・投稿地域・募集内容)  
* 投稿者による削除  
* ページネーション機能(vuejs-paginate)


### メッセージ  
* ダイレクトメッセージ・やりとりをしているユーザー一覧の表示

### 検索  
* マイクロポスト(検索項目 キーワード)  
* 掲示板(検索項目 キーワード・募集地域)  
* ユーザーの検索(検索項目 キーワード・ユーザーステータス・登録地域)  


## 改良予定  
* レスポンシブ対応
