# WordPress Gutenberg Block Lab

This repository provides a local environment for building and testing custom Gutenberg blocks.

## Requirements
- Docker and Docker Compose
- Node.js 18 or later

## Setup

1. Start WordPress and MySQL using Docker Compose:
   ```bash
   docker-compose up -d
   ```
   WordPress will be available at [http://localhost:8000](http://localhost:8000).

2. Install block development dependencies:
   ```bash
   npm install
   ```

3. Build the example block:
   ```bash
   npm run build
   ```

   For development with automatic rebuilds, run:
   ```bash
   npm run start
   ```

4. Activate the plugin inside WordPress using WP-CLI:
   ```bash
   npm run wp plugin activate my-custom-block
   ```

The `npm run wp` command allows you to run any WP‑CLI command. For example, to install WordPress with test data:
```bash
npm run wp core install --url=http://localhost:8000 --title=WP --admin_user=admin --admin_password=admin --admin_email=admin@example.com
```

## Directory Structure
- `docker-compose.yml` – Docker setup for WordPress, MySQL and WP‑CLI
- `plugins/my-custom-block/` – Sample block plugin scaffolded with `@wordpress/create-block`

After running the above commands you can immediately start modifying the files in `plugins/my-custom-block/src/` and see changes reflected in your local WordPress site.
