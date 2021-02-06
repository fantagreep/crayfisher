
# Crayfisher

Crayfisherは子供の遊び場スポットを共有するサービスです。
ザリガニ釣りスポット、クワガタの取れる木、トカゲがいる場所、ネットでは出てこない遊び場スポットを知りたい時、是非Crayfisherを是非ご利用ください。

また、子供の頃よく行っていた遊び場があれば全国のお母さん、お父さんたちのために是非共有してください。

Qiita : https://qiita.com/mizuno_jin/items/af125a02fe6921725352
<br> URL : https://crayfisher.herokuapp.com/ 

ログイン用

- メールアドレス：example@example.com

- パスワード：foobar

## 実装機能&使用している技術

#### 地名による地図検索機能
![ezgif.com-gif-maker.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/1059259/f45f42e6-a8c9-3608-277d-18136734a9ad.gif)
GooglemapAPIの機能の一つであるGeocodeを使用して作成しました。検索すると自動で地名、緯度、経度がFormに入力されます。

#### 地図クリックによる座標取得
![ezgif.com-gif-maker (1).gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/1059259/3c79f9a4-07f9-bd93-69e3-cd42f6b7a0c1.gif)
<br>地図をクリックすることで座標を取得できる機能を実装しました。クリックした場所の地名、緯度、経度を取得し自動的にFormへ自動入力します。（緯度と経度のformはhiddenで設定している為ブラウザ上では表示されません。自動入力された地名は変更可能です)

#### Ransackを利用した検索機能
投稿内容、ユーザー名、地名のいずれでも検索ができます。

#### JQueryを利用したModal表示機能
JQueryを利用し、Googlemap上の吹き出しをクリックすれば投稿内容がモーダルで表示されるようにしました。
![ezgif.com-gif-maker (2).gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/1059259/db44c138-018e-b965-a5ec-6f0b94dde25e.gif)

#### レスポンシブ対応
レスポンシブ対応を取り入れました。
![ezgif.com-gif-maker (3).gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/1059259/70c44c36-f982-7bc9-6fad-f5e4e5866cde.gif)

* CircleCIによる継続的インテグレーション
* Dockerによる環境構築
* 認証機能(devise)
* ページネーション機能
* Deviseを利用したログイン機能
* パスワード変更ページ
<br>現在のパスワード、新しいパスワード、新しいパスワードの確認入力欄があり、現在のパスワードが正しく、新しいパスワードと新しいパスワードの入力欄が一致する場合にパスワードが更新される。
* 投稿機能
<br>投稿、編集、削除、画像投稿機能。投稿時には投稿内容に加えて住所、緯度、経度も投稿可能。
* コメント機能
<br>投稿に対してコメント投稿ができる。本人のコメントは編集、削除可能。
* Rspecを使用した自動テスト
* rubocopを使用した静的コード解析ツール
* Googlemap API
* gem "bullet"を利用したN+1問題の検出・解決
* sass, slimを使用した記述
* AWS S3を利用したクラウドストレージ
* Google Analyticsによるアクセス解析

## 環境
* ホストOS : MacOS
* データベース：Postgresql
* 言語 : HTML CSS(SCSS) JavaScript Ruby SQL
* フレームワーク : Ruby on Rails
* CSSフレームワーク : bootstrap
* JSライブラリ : jQuery
* インフラ : heroku Docker AWS S3
* テストフレームワーク : RSpec
* その他ツールなど : Git Github Rubocop CircleCI 

##関連リンク
<br>[twitter](https://twitter.com/AePSRBFf5TyY7cL)
<br>[Qiita](https://qiita.com/mizuno_jin/items/af125a02fe6921725352)

