# WordPress Gutenberg ブロックラボ

このリポジトリはカスタム Gutenberg ブロックを構築・テストするためのローカル環境を提供します。

## 必要なもの
- Docker と Docker Compose
- Node.js 18 以上

## セットアップ

1. Docker Compose を使って WordPress と MySQL を起動します:
   ```bash
   docker compose up -d
   ```
   起動時には `setup` サービスが走り、`wp-config.php` が自動生成されます。
   `docker-compose.yml` では `WORDPRESS_DB_HOST` などの環境変数で DB 接続情報を明示的に指定しています。
   コンテナが起動すると WordPress が自動的にインストールされ、サンプルプラグインが有効化されます。
   [http://localhost:8000](http://localhost:8000) にアクセスしてください。

   既に `wp-config.php` が存在して設定が合わない場合は次を実行して再生成できます:
   ```bash
   npm run setup
   ```
   あるいはボリュームを削除してから再度 `docker-compose up -d` し直してください:
   ```bash
   docker-compose down -v
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

WordPress を再インストールする必要がある場合やサンプルプラグインを再度有効化したい場合は次を実行します:
```bash
npm run setup
```

`npm run wp` コマンドは任意の WP‑CLI コマンドを実行できます。例えばテストデータ付きで WordPress をインストールするには次のようにします:
```bash
npm run wp core install --url=http://localhost:8000 --title=WP --admin_user=admin --admin_password=admin --admin_email=admin@example.com
```

## ディレクトリ構成
- `docker-compose.yml` – WordPress、MySQL、WP‑CLI 用の Docker セットアップ
- `plugins/my-custom-block/` – `@wordpress/create-block` で作成したサンプルブロックプラグイン

以上のコマンドを実行すると `plugins/my-custom-block/src/` のファイルを編集し、ローカル WordPress サイトで変更を確認できます。
