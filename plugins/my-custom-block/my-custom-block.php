<?php
/**
 * Plugin Name:       My Custom Block
 * Description:       Example block scaffolded with create-block.
 * Requires at least: 6.0
 * Requires PHP:      7.0
 * Version:           0.1.0
 * Author:            Your Name
 * License:           GPL-2.0-or-later
 * License URI:       https://www.gnu.org/licenses/gpl-2.0.html
 * Text Domain:       my-custom-block
 */

function create_block_my_custom_block_init() {
    register_block_type( __DIR__ . '/build' );
}
add_action( 'init', 'create_block_my_custom_block_init' );
