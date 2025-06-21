# WordPress Gutenberg ブロックラボ

カスタム Gutenberg ブロックを手軽に開発するための WordPress 実行環境です。Docker を利用するのでローカルに WordPress をインストールする必要はありません。

## 必要なもの
- Docker と Docker Compose
- Node.js 18 以上

## 使い方

1. コンテナを起動します
   ```bash
   docker compose up -d
   ```
   初回起動時に `setup` サービスが実行され `wp-config.php` が生成されます。
   WordPress 本体とサンプルプラグインも自動インストールされます。
   [http://localhost:8000](http://localhost:8000) にアクセスしてください。

   設定をやり直したい場合は次を実行します。
   ```bash
   npm run setup          # 設定ファイルを再生成
   # または
   docker-compose down -v # ボリュームを削除して最初からやり直す
   ```


2. ブロック開発用の依存関係をインストールします:
   ```bash
   npm install
   npm install --prefix plugins/my-custom-block
   ```

3. サンプルブロックをビルドします:
   ```bash
   npm run build
   ```

   自動再ビルドを有効にした開発モードは次のとおりです:
   ```bash
   npm run start
   ```

WordPress を再インストールする必要がある場合やサンプルプラグインを再度有効化したいときは `npm run setup` を実行してください.

`npm run wp` コマンドは任意の WP‑CLI コマンドを実行できます。例えばテストデータ付きで WordPress をインストールするには次のようにします:
```bash
npm run wp core install --url=http://localhost:8000 
  --title=WP --admin_user=admin 
  --admin_password=admin --admin_email=admin@example.com
```

## ディレクトリ構成
- `docker-compose.yml` – WordPress、MySQL、WP‑CLI 用の Docker セットアップ
- `plugins/my-custom-block/` – `@wordpress/create-block` で作成したサンプルブロックプラグイン

以上のコマンドを実行すると `plugins/my-custom-block/src/` のファイルを編集し、ローカル WordPress サイトで変更を確認できます。
