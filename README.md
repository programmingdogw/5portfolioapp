# 主に使用した技術・言語
  - ruby
  - ruby on rails
  - haml
  - sass
  - jQuery
  - mySQL
  - AWS(EC2,S3,IAM)
  - unicorn
  - nginx
  - gemなどの細かな部分
    - devise
    - ancestry
    - mini-magick
    - carrier-wave
    - active-hash
    - ransack
    - payjp
    - fog-aws
# 概要

商品の出品・検索・購入・利益の確認ができるアプリ


## 何故作ったか

#### 理由１：技術的にやってみたかった

チーム開発では個々人の分担量を考え、必須要件が期限までに完了する目処が立ってからはあえて担当する箇所を増やさないようにしたが、機能的に中途半端だったので気持ち悪かった。


そのため商品の出品や購入、利益の確認まで出来るアプリは作りたかった。また一人である程度の規模のアプリをrails newからデプロイまでやってみたかったが、適当な規模だと考えた。


#### 理由２：企業にも気軽に出品・購入する風潮が広がればいいなと思った


世の中にフリマアプリは多くあるが、無在庫転売禁止であったり、大量の在庫を捌くのには適していないので、そのあたりをコンセプトに改良を重ねていけばオリジナリティの高い物を作れるのではないかと考えた。


今までの時点では主に理由１の観点から一通りの機能を実装することに力を割いてきたが、今後は理由２を中心に考えて改良を重ねたい。


(例)


企業は発注を受けて製造してもOKにする


個人の場合は出品時点で在庫が無い場合はそれを明示し、出品者に品物が届き、OKされた時点で出品者に振り込む。


企業の在庫出品は個数を指定出来るようにし、購入者側は個人で単品を買ってもいいし、企業が仕入れとして大量発注することも出来るようにする


企業の備品等を日常的に出品してもらう。企業は古くなってきた備品が処分出来るし、購入者は企業から購入するなら安心。

## 良かった点
開発からデプロイ、売り上げのたて方まで想定するということを一通り経験出来た。（一応payjpでの購入で売り上げがたつようになっているので、いったんこちらのアプリに振り込んでもらい、利益分を振り込むような想定）。

##  悪かった点
前回のアプリでヘッダー、フッターを完全に共通にしたことが後のマークアップで邪魔だったので、今回は基本的に全ページのscssを書いたら作業量が増えた。今回はシンプルな構成だったのでapplicationで読み込むべきだった。


開発環境のうちにもう少しコンセプトをつめておくべきだった。本番にデプロイしてから大幅に変更することはリスクを増やすだけだと思った。


## 次にどう活かすか
現時点で出来なかった部分に改良を重ねて、本番環境を運用するという経験を積むと共に、開発環境をスムーズに本番に反映するためDockerを学習する（php使用）。


共通化出来る部分は早めに共通化する。デザインに強く拘って作っている時でなければ極力共通化して開発作業に専念する。



# 機能紹介

### ウィザード形式によるユーザー登録機能
![portfolio-registration](https://user-images.githubusercontent.com/59106983/81923934-5dc8a200-9619-11ea-9d0c-61fb2ba7843a.gif)


### 階層的なカテゴリ設定機能
![ptfーcategory](https://user-images.githubusercontent.com/59106983/81794494-d3633e00-9545-11ea-838d-9e2d2c801658.gif)



### 複数枚画像投稿できる出品機能
![ptfimagepost](https://user-images.githubusercontent.com/59106983/81794802-4c629580-9546-11ea-9657-f8e47bc1fb65.gif)


### 標準的な詳細表示・編集・削除機能
![portfolio-item-detail](https://user-images.githubusercontent.com/59106983/81924080-936d8b00-9619-11ea-94fc-c6d18f440353.gif)


### 商品に対するコメント機能
![portfoliocomments](https://user-images.githubusercontent.com/59106983/82196658-f2424580-9934-11ea-8dc7-61a4ffbc9cf6.gif)


### payjpを使った決済
![portfolio-payjp_1](https://user-images.githubusercontent.com/59106983/82042461-db0d1900-96e4-11ea-9c5a-1562ee7cb387.gif)


### マイページから売り上げや出品中、売却済みの商品の確認等が可能
![portfolio-sales_1](https://user-images.githubusercontent.com/59106983/82042514-f6782400-96e4-11ea-894d-a17c26dd1dd2.gif)


### ハンバーガーメニューで快適にサイト内移動
![portfolio-hamburger](https://user-images.githubusercontent.com/59106983/81794984-8a5fb980-9546-11ea-8d06-84e29c9a1743.gif)


## 様々な検索機能


### キーワード検索
![portfolio-search](https://user-images.githubusercontent.com/59106983/81924629-55249b80-961a-11ea-9ea5-97e8f9c404a0.gif)


### 並べ替え検索
![portfolio-orderchange](https://user-images.githubusercontent.com/59106983/81926825-8d79a900-961d-11ea-98dc-c2522816b782.gif)


### 条件検索
![portfolio-deailsearch](https://user-images.githubusercontent.com/59106983/81926923-c0bc3800-961d-11ea-9565-75a42f7d0074.gif)


### カテゴリ検索１
![portfolio-categorysearch](https://user-images.githubusercontent.com/59106983/81926975-d893bc00-961d-11ea-9780-717ee81c6922.gif)


### カテゴリ検索２
![portfolio-categorysearch2](https://user-images.githubusercontent.com/59106983/81927016-e8ab9b80-961d-11ea-872a-ee789fab6d36.gif)



## レスポンシブなサイト構成


### レスポンシブ０
![responsive0](https://user-images.githubusercontent.com/59106983/81793742-c1cd6680-9544-11ea-9210-b04b2f00cce9.gif)

### レスポンシブ１
![responsive1](https://user-images.githubusercontent.com/59106983/81793871-e6c1d980-9544-11ea-8a07-483cf23435d2.gif)

### レスポンシブ２
![responsive2](https://user-images.githubusercontent.com/59106983/81793999-12dd5a80-9545-11ea-9e38-91cf26b9d8eb.gif)

### レスポンシブ３
![responsive3](https://user-images.githubusercontent.com/59106983/81794121-3f917200-9545-11ea-8f81-5afdc76724d7.gif)


### ※
アップデートや改装により一部gif画像と異なる場合がありますがご了承ください


