# オープンデータ半自動作成の技術 サンプルコード

2017/4/9にアキバ・スクエアで行われた技術書典2にて頒布した
「Code for 同人誌」内、「オープンデータ半自動作成の技術」で紹介した仕組みのサンプルコードです。

本コードでは、下記のgemを使用しています。

* selenium-webdriver (https://rubygems.org/gems/selenium-webdriver/)
* page-object (https://rubygems.org/gems/page-object)
* turnip (https://rubygems.org/gems/turnip)

Selenium Webdriver, Chromedriverをインストールした後、
下記コマンドで実行をしてください。

```
bundle install --path vendor/bundle
bundle exec rspec spec
```
