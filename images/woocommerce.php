<?php
/**
 * Used to override WooCommerce functionality, Removing hooks e.t.c.
 *
 * @package hpy
 */

add_filter('woocommerce_get_image_size_single', function($size){
	return array(
		'width' => 600,
		'height' => 600,
		'crop' => 1,
	);
});

// generic //
remove_action( 'woocommerce_before_main_content', 'woocommerce_breadcrumb', 20 );

// remove all the product notices so we can hook them back in at our own position
remove_action( 'woocommerce_before_shop_loop', 'wc_print_notices', 10 );
remove_action( 'woocommerce_shortcode_before_product_cat_loop', 'wc_print_notices', 10 );
remove_action( 'woocommerce_before_single_product', 'wc_print_notices', 10 );

// add_action( 'woocommerce_before_main_content', 'itb_breadcrumbs', 5 ); // hook in full screen breadcrumbs wrapper

/* archive-product.php */
remove_action( 'woocommerce_before_main_content', 'woocommerce_output_content_wrapper', 10 );
remove_action( 'woocommerce_after_main_content', 'woocommerce_output_content_wrapper_end', 10 );
remove_action( 'woocommerce_sidebar', 'woocommerce_get_sidebar', 10 );
remove_action( 'woocommerce_before_shop_loop', 'woocommerce_result_count', 20 );
remove_action( 'woocommerce_before_shop_loop', 'woocommerce_catalog_ordering', 30 );
remove_action( 'woocommerce_archive_description', 'woocommerce_taxonomy_archive_description', 10 );
remove_action( 'woocommerce_archive_description', 'woocommerce_product_archive_description', 10 );

add_action( 'woocommerce_archive_description', 'get_category_description', 10 );

add_action( 'woocommerce_before_main_content', 'open_bootstrap_wrapper', 10 );
	add_action( 'woocommerce_before_main_content', 'open_itb_sidebar', 10 );

	// archive - has products
		add_action( 'woocommerce_before_shop_loop', 'itb_get_sidebar', 10 );
	add_action( 'woocommerce_before_shop_loop', 'close_itb_sidebar', 20, 1 );
	add_action( 'woocommerce_before_shop_loop', 'open_shop_main', 30 );
	//add_action( 'woocommerce_before_shop_loop', 'manual_categories', 40 );
	add_action( 'woocommerce_after_shop_loop', 'open_shop_footer', 5 );
	add_action( 'woocommerce_after_shop_loop', 'woocommerce_result_count', 8 );
	add_action( 'woocommerce_after_shop_loop', 'close_single_div', 15 ); // close shop footer row
	add_action( 'woocommerce_after_shop_loop', 'close_single_div', 16 ); // close shop footer wrap
	add_action( 'woocommerce_after_shop_loop', 'close_main', 20 );

	// archive - no products
	add_action( 'woocommerce_no_products_found', 'itb_get_sidebar', 1 );
	add_action( 'woocommerce_no_products_found', 'close_itb_sidebar', 5 );
	add_action( 'woocommerce_no_products_found', 'open_shop_main', 6 );
	add_action( 'woocommerce_no_products_found', 'close_main', 15 );

	// archive - single product
	add_action( 'woocommerce_before_shop_loop_item', 'open_archive_product', 5 );
	remove_action( 'woocommerce_after_shop_loop_item', 'woocommerce_template_loop_add_to_cart', 10 );
	add_action( 'woocommerce_after_shop_loop_item', 'insert_ga_product_details' );
	remove_action( 'woocommerce_after_shop_loop_item_title', 'woocommerce_template_loop_rating', 5 );
	add_action( 'woocommerce_before_shop_loop_item_title', 'open_product_details', 20 );
	add_action( 'woocommerce_after_shop_loop_item', 'close_single_div', 3 );
	add_action( 'woocommerce_after_shop_loop_item', 'close_single_div', 10 );

	// single product

	add_action( 'hn_woocommerce_before_single_product_summary', 'hn_main_product_image', 4, 1 );
	add_action( 'hn_woocommerce_before_single_product_summary', 'hn_product_sidebar_accordion', 4, 3 );
	
	// split test to decide which side the TP reviews show on
	add_action( 'woocommerce_single_product_summary', 'hn_sidebar_testimonials_right', 90 );
	add_action( 'hn_woocommerce_before_single_product_summary', 'hn_sidebar_testimonials', 5 );

	remove_action( 'woocommerce_before_single_product_summary', 'woocommerce_show_product_sale_flash', 10 );
	add_action( 'woocommerce_before_single_product_summary', 'open_single_product_details_wrap', 15 );
	remove_action( 'woocommerce_before_single_product_summary', 'woocommerce_show_product_images', 20 );

	//woocommerce_show_product_images

	add_action('woocommerce_single_product_summary', 'open_product_header', 2 );
			add_action('woocommerce_single_product_summary', 'open_product_titles_wrap', 4 );
			add_action( 'woocommerce_single_product_summary','woocommerce_template_single_rating', 10 );
			add_action('woocommerce_single_product_summary', 'close_single_div', 13 );
			add_action('woocommerce_single_product_summary', 'open_price_wrap', 14 );
				remove_action( 'woocommerce_single_product_summary', 'woocommerce_template_single_excerpt', 20 );
				remove_action( 'woocommerce_single_product_summary', 'woocommerce_template_single_meta', 40);
			add_action('woocommerce_single_product_summary', 'close_single_div', 16 );
		add_action( 'woocommerce_single_product_summary', 'HPY_ITB_Trustpilot_API::output_single_product_head_rating', 18 );
	add_action('woocommerce_single_product_summary', 'close_header', 20 );
	
	// images again, for mobiles
	add_action( 'woocommerce_single_product_summary', 'hn_main_product_image_mobile', 20, 1 );

	add_action( 'woocommerce_after_single_product_summary', 'close_single_div', 4 );
	add_action( 'woocommerce_after_single_product_summary', 'close_product_container', 5 );
	add_action( 'woocommerce_after_single_product_summary', 'open_row_container', 12 );
	remove_action( 'woocommerce_after_single_product_summary', 'woocommerce_output_related_products', 20 );

add_action( 'woocommerce_after_main_content', 'close_single_product', 1 ); // close the main wrap for single products
add_action( 'woocommerce_sidebar', 'close_bootstrap_wrapper', 10 );


add_filter( 'woocommerce_cart_item_thumbnail', 'filter_woocommerce_cart_item_thumbnail', 10, 3 );
function filter_woocommerce_cart_item_thumbnail( $product_get_image, $cart_item, $cart_item_key ) { 

	if(isset($cart_item['hpy_personalisation_data']['papers'][0])){
		return '<img src="' . $cart_item['hpy_personalisation_data']['papers'][0]['image'] . '" class="attachment-shop_thumbnail wp-post-image"/>';
	}

    return $product_get_image; 
}; 

// prepare the cart data to display in the top table on product pages (for editing cart items)
function prepare_personalisation_data($key, $raw_data) {
	
	$title = '';
	$attrib = '';
	$data_order = 0;
	$classExt = '';
	$data = [];
	$type = 'personalisation';
	$additionalInfo = [];
	
	if (in_array($key, array('mdates'))) {
		$titleArr = [];
		$date = '';
		$day = '';
		$month = '';
		$year = '';
		
		$raw_dataArr = array_values($raw_data);
		$raw_data = $raw_dataArr[0];
		
		foreach ($raw_data as $mdkey => $raw_datam) {
			
			// handle editing after changing attributes and form structure
			// when raw data is not an array then it is direct date in human readbale format
			// we have to convert it into days, month and year
			
			$date_format = 'l, j F Y';
			if ($key == 'Start_Month') {
				$date_format = 'F Y';
			}
			
			if (is_array($raw_datam) && isset($raw_datam['date'])) {
				foreach ($raw_datam['date'] as $date_key => $date_value) {
					$day = isset($date_value['day']) ? $date_value['day'] : '1';
					if (isset($date_value['month']) && isset($date_value['year'])) {
						$month = $date_value['month'];
						$year = $date_value['year'];
						
						$fullMonth = hpy_get_month_number( $month );
						$timestring = $fullMonth . ' ' . $day . ' ' . $year;
						$date = date( $date_format, strtotime( $timestring ) );
						
						$data = $date_value;	
					}
				}
			} else {
				$date = $raw_datam;
				$day = date("d", strtotime($date));
				$month = date("m", strtotime($date));
				$year = date("Y", strtotime($date));
				
				$date = date( $date_format, strtotime( $raw_datam ) );
			}
			
			foreach ($raw_datam['attrib'] as $attr => $info) {
				$attrib .= "data-$attr='$info'" . " ";	
			}
			
			$attrib .= "data-day='$day'" . " ";
			$attrib .= "data-month='$month'" . " ";
			$attrib .= "data-year='$year'" . " ";
			$titleArr[] = $date;
		}
		
		$title =  htmlspecialchars(json_encode($titleArr), ENT_QUOTES, 'UTF-8');
	} elseif (in_array($key, array('Date', 'Date_Of_Birth', 'Start_Month'))) {
		
		$date = '';
		$day = '';
		$month = '';
		$year = '';
		
		// handle editing after changing attributes and form structure
		// when raw data is not an array then it is direct date in human readbale format
		// we have to convert it into days, month and year
		
		$date_format = 'l, j F Y';
		if ($key == 'Start_Month') {
			$date_format = 'F Y';
		}
		
		if(is_array($raw_data) && isset($raw_data['date'])){
			foreach($raw_data['date'] as $date_key => $date_value){
				$day = isset($date_value['day']) ? $date_value['day'] : '1';
				if (isset($date_value['month']) && isset($date_value['year'])){
					$month = $date_value['month'];
					$year = $date_value['year'];
					
					$fullMonth = hpy_get_month_number( $month );
					$timestring = $fullMonth . ' ' . $day . ' ' . $year;
					$date = date( $date_format, strtotime( $timestring ) );
					
					$data = $date_value;	
				}
			}
		} else {
			$date = $raw_data;
			$day = date("d", strtotime($date));
			$month = date("m", strtotime($date));
			$year = date("Y", strtotime($date));
			
			$date = date( $date_format, strtotime( $raw_data ) );
		}
		
		foreach($raw_data['attrib'] as $attr => $info){
			$attrib .= "data-$attr='$info'" . " ";	
		}
		$attrib .= "data-day='$day'" . " ";
		$attrib .= "data-month='$month'" . " ";
		$attrib .= "data-year='$year'" . " ";
		$title = $date;
	} elseif ($key == 'papers') {
		// papers is now an array, first index being main paper, rest will be multinewspapers
		$data_order = 1;
		$classExt = 'papers';
		$data = $raw_data[0];
		if(is_array($data)){
			$title = $data['title'];
			foreach($data as $attr => $info){
				$attrib .= "data-$attr='$info'" . " ";
			}
		} 
	} elseif ($key == 'giftpack') {
		$data_order = 2;	
		$classExt = 'gift-pack';
		$data = $raw_data;
		$title = $data['name'];
		unset($data['multinewspapers']);
		foreach($data as $attrib_key => $info){
			$attrib .= "data-$attrib_key='$info'" . " ";
		}
	} elseif ($key == 'cert') {
		$data_order = 3;	
		$classExt = 'cert';
		$data = array(
			'title' => 'Certificate of Authenticity',
			'cert_name' => $raw_data['presented'],
			'cert_occasion' => $raw_data['occasion']
		);
		foreach($data as $attrib_key => $info){
			$attrib .= "data-$attrib_key='$info'" . " ";
		}
		
		// additional attributes if they exist
		foreach($raw_data['attrib'] as $attrib_key => $info){
			$attrib .= "data-$attrib_key='$info'" . " ";
		}
		
		// messages, index should start from 0, not 1
		foreach ($raw_data['message'] as $i => $message) {
			$attrib .= "data-cert_message_".($i)."='$message'" . " ";
		}
		$title = 'Certificate of Authenticity';
	
	// this is a tricky one, as we want to try and catch general textarea
	// type personalisations, which often have the XML key "Cert_Message"
	
	} elseif (strstr(strtolower($key), 'message') && is_array($raw_data)) {
		
		$title = implode(', ', array_filter($raw_data));
		$classExt = 'message';
		
		// messages, index should start from 0, not 1
		foreach ($raw_data as $i => $message) {
			$attrib .= "data-message_".($i)."='$message'" . " ";
		}

	} elseif ($key == 'onj' && is_array($raw_data)) { 
		$type = 'personalisation';
		/*foreach ($value as $key_personl => $personl) {
		  output_edit_cart_item_line( $key_personl, $personl['title'], 'personalisation' );
		}*/
	} else {
		$title = $raw_data;
		#output_edit_cart_item_line( $key, $value, 'personalisation' );	
	}
	
	$additionalInfo['data_order'] = $data_order;
	$additionalInfo['classExt'] = $classExt;
	$additionalInfo['attrib'] = $attrib;
	
	return array($key, $title, $type, $additionalInfo);
}


add_action('woocommerce_before_add_to_cart_button', 'hpy_edit_cart_item', 0 );
function hpy_edit_cart_item(){
	$cart_item = hpy_get_cart_item_data();
	if( false !== $cart_item ){ 
		$cart_data = apply_filters('itb_remove_variations_from_personalisations', $cart_item );
		$cart_data = array_filter($cart_data, function($value) { return !is_null($value) && $value !== ''; })
		?>
		<div id="itb_pers_edit_wrap">
		<?php
		
			foreach( $cart_item['variation'] as $key => $value ) :
				output_edit_cart_item_line( str_replace('attribute_', '', $key ), $value, 'variation' );
			endforeach;

			$is_special = false;
			if( class_exists('acf') && is_array( $special = get_field('is_newspaper', $cart_item['product_id'] ) ) ){
				$is_special = false !== array_search( 'special', $special );
			}

			
			foreach( $cart_data as $key => $value ) :
				// skip the file upload fields since we can't repopulate
				
				if( in_array( $key, apply_filters('hpy_pers_edit_skip_key', Hpy_Add_Meta_Data::$skip_fields ) ) ){
					continue;
				}

				if( $key == 'upload' && is_array( $value ) ){
					foreach( $value as $k => $v ){
						output_edit_cart_item_line( $k, $v, 'upload' );
						echo '<div class="itb_pers_edit hpy_hidden_input_upload_url" data-key="input_upload_' . $k . '" data-value="' . $v . '" data-type="hidden"></div>';
					}
				}else if( $key == 'upload-path' ){
					foreach( $value as $k => $v ){
						echo '<div class="itb_pers_edit hpy_hidden_input_upload_path" data-key="input_path_' . $k . '" data-value="' . $v . '" data-type="hidden"></div>';
					}
				}else if( $key == 'upsell' && is_array( $value ) ){
					foreach( $value as $k => $v ){
						output_edit_cart_item_line( $k, $v, 'upsell' );
					}
				}else if( $key == 'extra_price' ){
					echo '<div class="hpy_hidden_input_edit" data-key="extra_price" data-value="' . $value . '" data-type="hidden"></div>';
				}else{
					if( $is_special && strrpos( $key, 'No-of-' ) !== false ){
						output_edit_cart_item_line( substr($key, 0, -1), $value, 'special' );
					} else {
						if ($key != 'onj') {
							list($key, $title, $type, $additionalInfo) = prepare_personalisation_data($key, $value);
							output_edit_cart_item_line($key, $title, $type, $additionalInfo);
						}
					}
				}

			endforeach;
		?></div>
		<input type="hidden" name="hpy_edit_cart_key" value="<?php echo $_GET['edit']; ?>">
	<?php }
}

function output_edit_cart_item_line($key, $value, $type, $additionalInfo = array()) {
	
	$data_order = $additionalInfo['data_order'];
	$classExt = $additionalInfo['classExt'];
	$additionalInfo = $additionalInfo['attrib'];
?>

	<div class="itb_pers_edit_<?php echo $classExt; ?>" data-order="<?php echo $data_order?>" data-key="<?php echo $key; ?>" data-value="<?php echo $value; ?>" data-type="<?php echo $type; ?>"  <?php echo $additionalInfo; ?> style="display:flex;">
		<div class="itb_pers_ele_wrap">
			<span class="itb_pers_edit_tick"><?php hpy_svg('tick'); ?></span>
		</div>
		<div class="itb_pers_edit_details">
			<span class="itb_pers_edit_name"></span>
			<span class="itb_pers_edit_value"><?php
				
				if(  $type == 'upload' && '' != trim( $value ) ){
					echo '<img src="' . $value . '" alt="Uploaded Image" />';
				} else if ( $type == 'upsell' ){
					echo $value;
				}else if ( is_array( $value ) ){
					echo implode( ', ', $value );
				} else{
					echo $value;
				}
			?></span>
		</div>
		<div class="itb_pers_ele_wrap itb_pers_edit">
			<span><?php echo __('Edit', 'hpy' . get_hpy_svg('edittick')); ?></span>
		</div>
	</div><?php

}
function open_row(){
	echo '<div class="row">';
}

function open_single_images_wrap(){
	echo '<div class="single_product_images_wrap">';
}

function close_product_container(){
	echo '</div></div></div></div>';
}

function open_row_container(){
	echo '<div class="container">';
	open_row();
}

function open_bootstrap_wrapper(){
	global $woocommerce;
	if( is_product() ){
		echo '<main class="content-wrap"><div class="container"><div class="row">';
	}else{
		echo '<div class="container content-wrap"><div class="row">';
	}
}

function close_bootstrap_wrapper(){
	global $woocmmerce;
	if( is_product() ){
		echo '</main>';
	}else{
		echo '</div></div>';
	}

}

function hn_main_product_image() {
	global $product;

	$attachment_ids = $product->get_gallery_attachment_ids();

	if($attachment_ids){
		echo '<ul class="hn-product-images">';
			foreach ( $attachment_ids as $attachment_id ) {
				$full_size_image = wp_get_attachment_image_src( $attachment_id, 'full' );
				$thumbnail       = wp_get_attachment_image_src( $attachment_id, 'shop_thumbnail' );						

				$html  = '<li data-thumb="' . esc_url( $thumbnail[0] ) . '" class="woocommerce-product-gallery__image">';
						$html .= wp_get_attachment_image( $attachment_id, 'shop_single' );						
				$html .= '</li>';

				echo apply_filters( 'woocommerce_single_product_main_image_thumbnail_html', $html, $attachment_id );
			}
		echo '</ul>';
	} else {
		$image_id = get_post_thumbnail_id();
		$image_alt = get_post_meta($image_id, '_wp_attachment_image_alt', TRUE);
		$arr = array('title' => get_the_title(), 'alt' => $image_alt);
		the_post_thumbnail(false, $arr);
	}
}

function hn_main_product_image_mobile() {
	global $product;

	$attachment_ids = $product->get_gallery_attachment_ids();

	if($attachment_ids){
		echo '<ul class="hn-product-images mobile">';
			foreach ( $attachment_ids as $attachment_id ) {
				$full_size_image = wp_get_attachment_image_src( $attachment_id, 'full' );
				$thumbnail       = wp_get_attachment_image_src( $attachment_id, 'shop_thumbnail' );						

				$html  = '<li data-thumb="' . esc_url( $thumbnail[0] ) . '" class="woocommerce-product-gallery__image">';
						$html .= wp_get_attachment_image( $attachment_id, 'shop_single' );						
				$html .= '</li>';

				echo apply_filters( 'woocommerce_single_product_main_image_thumbnail_html', $html, $attachment_id );
			}
		echo '</ul>';
	}
}

function open_hn_product_container(){
	echo '<div class="container">';
}

function open_hn_product_row(){
	echo '<div class="flex-row">';
}

function open_hn_product_sidebar(){
	echo '<div class="hn_single_product_sidebar col-mdlg-4 col-mdlg-offset-1">';
}

function open_hn_product_main(){
	echo '<div class="hn_single_product_main col-mdlg-6 col-mdlg-offset-1">';
}

function hn_sidebar_test(){
	echo 'Sidebar';
}

function hn_main_test(){
	echo 'Main content test';
}

function hn_close_div(){
	echo '</div>';
}

function hn_product_title(){
	the_title( '<h1 class="product_title entry-title">', '</h1>' );
}

function hn_product_sidebar_accordion() {
	$promotions_heading = get_field('promotions_heading', 'option');
	$promotions_text = get_field('promotions_text', 'option');
	$product_specific_promotions = get_field('product_specific_promotions');
	$product_specific_promotions_title = get_field('product_specific_promotions_title'); 
	$product_specific_promotions_text = get_field('product_specific_promotions_text');
	$hide_delivery_section = get_field('hide_delivery_section');
	?>
	<div class="product-sidebar-accordion">
		<div class="sidebar-item-heading<?php echo $hide_delivery_section ? ' static' : ''; ?>"><span><i class="sidebar-icon"><img src="<?php echo THEME_IMAGES; ?>/delivery-icon.png" alt="Delivery From"></i><b>Delivery</b>&nbsp;&nbsp;From&nbsp;<span class='delivery-from'></span></span><?php if (!$hide_delivery_section): ?><i class="plus-minus"><span class="a-cross"></span></i><?php endif; ?></div>
		<div class="sidebar-item-content accordion">
			<?php echo do_shortcode('[hpy_itb_deliver_range_selector]'); ?>
		</div>

		<!-- global promo content -->
		<?php if($promotions_heading && !$product_specific_promotions) : ?>
			<div class="sidebar-item-heading">
				<span><i class="sidebar-icon"><img src="<?php echo THEME_IMAGES; ?>/promotion-icon.png" alt="Promotion"></i>
					<b>Promotion</b>&nbsp;&nbsp;
					<?= $promotions_heading; ?>
				</span>
				<i class="plus-minus"><span class="a-cross"></span></i>
			</div>
			<div class="sidebar-item-content accordion">
				<div class="promotion-text">
				<?= $promotions_text; ?>
				</div>
			</div>
		<?php endif; ?>
		<!-- // -->

		<!-- product specific promo content -->
		<?php if($product_specific_promotions) : ?>
			<div class="sidebar-item-heading">
				<span><i class="sidebar-icon"><img src="<?php echo THEME_IMAGES; ?>/promotion-icon.png" alt="Promotion"></i>
					<b>Promotion</b>&nbsp;&nbsp;
					<?= $product_specific_promotions_title; ?>
				</span>
				<i class="plus-minus"><span class="a-cross"></span></i>
			</div>
			<div class="sidebar-item-content accordion">
				<div class="promotion-text">
				<?= $product_specific_promotions_text; ?>
				</div>
			</div>
		<?php endif; ?>
		<!-- // -->

		<div class="sidebar-item-heading description-heading"><span><i class="sidebar-icon"><img src="<?php echo THEME_IMAGES; ?>/description-icon.png" alt="Description"></i><b>Description</b></span></div>
		<div class="sidebar-item-content description">
			<?php wc_get_template( 'single-product/tabs/description.php' ); ?>
		</div>
	</div>
	<?php
}

function open_itb_sidebar($term_id) {
	if (isset($term_id)) {
		$tax_meta = get_term_meta($term_id, 'hpy_itb_sidebar_override', true);
		$display = (is_array($tax_meta) && $tax_meta['enabled'] == true) ? 'block' : 'none';
	}

	if (is_product()) {
		echo '<div class="itb_single_product_main">';
	} else {
		if ($display == "none") {
			return;
		} else {
			echo '<div class="itb_sidebar" style="display:'.$display.'">';
		}
	}
}

function close_itb_sidebar(){
	close_single_div();
}

function open_shop_main(){
	global $post,$category;
	$category = get_queried_object();
	$tax_meta = get_term_meta($category->term_id, 'hpy_itb_sidebar_override', true);
	$on = false;
	if (isset($tax_meta) && !empty($tax_meta)) {
		$on = $tax_meta['enabled'];
	}
	
	echo '<main class="itb_shop_main">';
	if ($on) {
		echo '<div class="row shop_order_sort mobileFilterButton">
				<div class="shop_order_select show-mdlg-max"> 
					<span class="shop_order_filters">Filters 
					<svg class="svg-icon icon-chevron-down" aria-hidden="true"> <use xlink:href="#chevron-down"></use> </svg>
					</span>
				</div>
			</div>';
	}
}

function close_main(){
	echo '</main>';
}

function close_single_div(){
	echo '</div>';
}

function open_single_product_details_wrap(){
	echo '<div class="itb_single_product_wrap">';
}

function open_price_wrap(){
	echo '<div class="itb_single_product_price_wrap">';
}

function open_product_header(){
	echo '<header class="itb_single_product_header">';
}

function open_product_titles_wrap(){
	echo '<div class="itb_product_title_wrap">';
}

function close_header(){
	echo '</header>';
}

function open_archive_product(){
	echo '<div class="archive_product_wrap">';
}

function wrap_single_product_gallery_images(){
	echo '<div class="itb_single_product_gallery_wrap">';
}

function open_product_details(){
	echo '<div class="product_details">';
}

function insert_ga_product_details() {
	global $product;
	
	$product_id = $product->get_sku();
	$product_title = gtm4wp_woocommerce_html_entity_decode($product->get_title());
	$product_cat = gtm4wp_get_product_category( $product->get_id(), true );
	$product_price  = floatval( $product->get_price() );
	
	echo '<span class="ga-data ga-product-id">'.$product_id.'</span>';
	echo '<span class="ga-data ga-product-title">'.$product_title.'</span>';
	echo '<span class="ga-data ga-product-cat">'.$product_cat.'</span>';
	echo '<span class="ga-data ga-product-price">'.$product_price.'</span>';
}

function filter_gallery_column_no(){
	return 5;
}

function close_single_product(){
	global $woocommerce;
	if( is_product() ){
		close_single_div();
	}
}

function itb_breadcrumbs(){
	if( ! itb_not_use_breadcrumbs() ) :?>
		<div class="itb-breadcrumbs-wrap">
			<div class="container">
				<div class="row">
					<?php yoast_breadcrumb( '<div class="woocommerce-breadcrumb">','</div>' ); ?>
					<?php hpy_product_mobile_breadcrumbs(); ?>
				</div>
			</div>
		</div><?php
	endif;
}

function hpy_product_mobile_breadcrumbs(){
	if( is_product() ){
		global $product;
		$primary_cat_id = get_post_meta( $product->id, '_yoast_wpseo_primary_product_cat', true );

		if( empty( $primary_cat_id ) ){
			$primary_cat_id = get_category_from_product( $product->id );
		}

		$product_cat = get_term($primary_cat_id, 'product_cat');
		if( $product_cat->parent != 0 ){
			$ancestors = get_ancestors( $primary_cat_id, 'product_cat' );
			$parent_id = end( $ancestors );
			$parent_cat = get_term( $parent_id, 'product_cat' );
		}else{
			$parent_cat = $product_cat;
		}

		echo '<div class="woocommerce-breadcrumb breadcrumbs-mobile"><span>';
		echo '<span><a href="' .  get_term_link( $parent_cat->term_id, 'product_cat') . '">' . $parent_cat->name . '</a>' . '<span class="sep">></span>';
		echo '<strong class="breadcrumb_last">' . $product->get_name() . '</strong>';
		echo '</span></span></div>';

	}
}

function get_category_from_product( $id ){
	$term_list = get_the_terms( $id, 'product_cat' );
	return $term_list[0]->term_id;
}

// Don't show the breadcrumbs if the current page is any of the following
function itb_not_use_breadcrumbs(){
	$bc = array(
		is_front_page(), // home page
		is_checkout(), // any checkout page, checkout login, thankyou
		! is_user_logged_in() && is_account_page(), // create account page
        is_page_template( 'template-labelredemption.php' ),
        is_page_template( 'template-tube.php' )
	);

	return in_array( true, $bc );
}

function itb_notices(){ ?>
	<div class="itb-notices-wrap">
		<?php wc_print_notices(); ?>
	</div><?php
}



function itb_print_category_ordering(){
	$per_page = filter_input(INPUT_GET, 'perpage', FILTER_SANITIZE_NUMBER_INT); ?>
	<div class="row shop_order_sort">
		<?php if( ! ( ! wc_get_loop_prop( 'is_paginated' ) || ! woocommerce_products_will_display() ) ): ?>
			<!-- <div class="shop_order_select show-mdlg-max">
				<span class="shop_order_filters"><?php _e('Filters', 'hpy'); hpy_svg('chevron-down'); ?></span>
			</div> -->
			<div class="shop_order_select shop_order_pp">
				<div class="select-wrap">
					<form action="" class="itb-perpage" method="get">
						<label for="perpage"><?php _e('Items per page', 'hpy'); ?></label>
						<select name="perpage" id="perpage">
							<option value="15" <?php selected( $per_page, 15 ); ?>>15</option>
							<option value="30" <?php selected( $per_page, 30 ); if( ! isset( $per_page ) ){
								echo 'selected="selected"';
							} ?>>30</option>
							<option value="60" <?php selected( $per_page, 60 ); ?>>60</option>
						</select>
						<input type="hidden" name="paged" value="1" />
						<?php wc_query_string_form_fields( null, array( 'perpage', 'submit', 'paged', 'product-page' ) ); ?>
					</form>
				</div>
			</div>
			<div class="shop_order_select shop_order_sort_inner">
				<div class="select-wrap flex"><?php woocommerce_catalog_ordering(); hpy_svg('chevron-down'); ?></div>
			</div>
		<?php endif; ?>

	</div><?php
}

function open_shop_footer(){
	echo '<div class="itb_shop_footer"><div class="row">';
}

function itb_get_sidebar(){
	$category = get_queried_object();
	$isSearch = ! $category instanceof WP_Term || isset( $_GET['s'] );

	if( ! ( ! wc_get_loop_prop( 'is_paginated' ) || ! woocommerce_products_will_display() ) ){
		$tax_meta = get_term_meta( $category->term_id, 'hpy_itb_sidebar_override', true );

		if( is_array( $tax_meta ) ){
			if ( !isset( $tax_meta['enabled'] ) ) {
				$tax_meta['enabled'] = false;
			}

			$enabled = $tax_meta['enabled'];
			unset( $tax_meta['enabled'] );
		}else{
			$enabled = false;
		}
		if ( $enabled ) {
			if ( count( $tax_meta ) >= 1) {
				$active_filters = hpy_get_currently_active_filters();
				$url = parse_url( hpy_get_current_page_url() );
				?>
				<div class="itb_shop_sidebar_wrap<?php echo ! empty( $active_filters ) ? ' has-filters' : ''; ?>">
					
					<div class="itb_shop_sidebar_inner">
						<header class="itb_shop_sidebar_header">
							<span class="searchFaster">Search Faster</span>
							<a href="<?php echo $url['scheme'] . '://' . $url['host'] . $url['path'] ?>?clear=1"
							class="itb_clear_filters<?php echo ! empty( $active_filters ) ? ' open' : ''; ?>"><?php hpy_svg('cross-icon');
								_e('Clear all', 'hpy') ?></a>
							<a href="#" class="hpy_close_mobile_fitlers show-mdlg-max"><?php hpy_svg('cross-icon'); ?></a>
							<div class="itb_shop_sidebar_current_filters"><?php
								echo $active_filters;
								?></div>
						</header>
						<div class="itb_shop_sidebar_inner_wrap"<?php echo empty( $isSearch ) ? '' : ' data-search="1"'; ?>>
							<?php
							if ( empty( $isSearch ) ) {
								dynamic_sidebar('itb-sidebar');
							} else {
								the_widget( 'WC_Widget_Price_Filter', array(
									'title' => "By Price",
								), array(
									'name' => "Shop Sidebar",
									'id' => "itb-sidebar",
									'description' => "Add widgets here.",
									'class' => '',
									'before_widget' => "<div id=\"woocommerce_price_filter-2\" class=\"widget woocommerce widget_price_filter\">",
									'after_widget' => "</div>",
									'before_title' => "<h2 class=\"widget-title\">",
									'after_title' => "</h2>",
									'widget_id' => "woocommerce_price_filter-2",
									'widget_name' => "Filter Products by Price",
								)
							); // print out the price filter widget here then ajaxily get the other widgets
							}
							?>
						</div>
					</div>
				</div>
			<?php }
		} else {
			$active_filters = hpy_get_currently_active_filters();
			
			//checks to see if active filters - then blocks execution if none found
			$tax_meta = get_term_meta($term_id, 'hpy_itb_sidebar_override', true);
			$display = (is_array($tax_meta) && $tax_meta['enabled'] == true) ? 'block' : 'none';
			if ($display == "none") {
				return;
			}
			
			$url = parse_url(hpy_get_current_page_url());
			?>
			<div class="itb_shop_sidebar_wrap<?php echo ! empty( $active_filters ) ? ' has-filters' : ''; ?>">
				<div class="itb_shop_sidebar_inner">
					<header class="itb_shop_sidebar_header">
						<a href="<?php echo $url['scheme'] . '://' . $url['host'] . $url['path'] ?>?clear=1"
						class="itb_clear_filters<?php echo !empty($active_filters) ? ' open' : ''; ?>"><?php hpy_svg('cross-icon');
							_e('Clear all', 'hpy') ?></a>
						<a href="#" class="hpy_close_mobile_fitlers show-mdlg-max"><?php hpy_svg('cross-icon'); ?></a>
						<div class="itb_shop_sidebar_current_filters"><?php
							echo $active_filters;
						?></div>
					</header>
					<div class="itb_shop_sidebar_inner_wrap"<?php echo empty( $isSearch ) ? ''  : ' data-search="1"'; ?>>
						<?php
						if( empty( $isSearch ) ){
							dynamic_sidebar('itb-sidebar');
						}else{
							the_widget( 'WC_Widget_Price_Filter', array(
								'title' => "By Price",
							), array(
								'name' => "Shop Sidebar",
								'id' => "itb-sidebar",
								'description' => "Add widgets here.",
								'class' => '',
								'before_widget' => "<div id=\"woocommerce_price_filter-2\" class=\"widget woocommerce widget_price_filter\">",
								'after_widget' => "</div>",
								'before_title' => "<h2 class=\"widget-title\">",
								'after_title' => "</h2>",
								'widget_id' => "woocommerce_price_filter-2",
								'widget_name' => "Filter Products by Price",
							));
						} ?>
					</div>
				</div>
			</div>
			<?php
		}
	} ?>	
<?php
}

function manual_categories(){
	$product_cat_object = get_queried_object();
	if( have_rows('add_category_links_manually', 'product_cat_' . $product_cat_object->term_id) ): ?>

		<div class="hnManualCategories">
				<?php while( have_rows('add_category_links_manually', 'product_cat_' . $product_cat_object->term_id) ): the_row(); 

					// vars
					$add_category_image = get_sub_field('add_category_image');
					$add_category_title = get_sub_field('add_category_title','1578' );
					$category_url = get_sub_field('category_url');

					?>

					<div class="manualCategory">
						<a href="<?= $category_url ?>">
							<?= $add_category_title; ?>
						</a>
					</div>

				<?php endwhile; ?>
		</div>
		<div class="sep-line"></div>

	<?php endif;
}

function hpy_get_currently_active_filters(){

	ob_start();

	foreach( $_GET as $key => $val ){
		if( substr( $key, 0, 7 ) === 'filter_' || ( $key == 's' && ! empty( $_GET['s'] ) ) ){
			if( $key == 's' ){
				$href = remove_query_arg( $key, hpy_get_current_page_url() );
				$title = sprintf( __('Search: %s', 'hpy'), $_GET['s']);
				printf( '<div class="itb_applied_filter" ><a href="%s">%s</a>%s</div>', $href, get_hpy_svg('cross-icon'), $title );
			}else{
				$tax_name = str_replace( 'filter_', '', $key );
				$taxonomy = wc_attribute_taxonomy_name( $tax_name );
				$vals = explode( ',', $val );
				foreach( $vals as $v ){
					if( empty( $v ) ){
						continue;
					}
					$term = get_term_by('slug', $v, $taxonomy );
					$href = remove_query_arg( $key, hpy_get_current_page_url() );
					printf( '<div class="itb_applied_filter" data-slug="%s" data-attrib="%s"><a href="%s">%s</a>%s</div>', esc_attr( $term->slug ), esc_attr( $tax_name ), $href, get_hpy_svg('cross-icon'), esc_html( $term->name ) );
				}
			}
		}
	}

	return ob_get_clean();
}

function hpy_get_current_page_url() {
	if ( defined( 'SHOP_IS_ON_FRONT' ) ) {
		$link = home_url();
	} elseif ( is_shop() ) {
		$link = get_permalink( wc_get_page_id( 'shop' ) );
	} elseif ( is_product_category() ) {
		$link = get_term_link( get_query_var( 'product_cat' ), 'product_cat' );
	} elseif ( is_product_tag() ) {
		$link = get_term_link( get_query_var( 'product_tag' ), 'product_tag' );
	} else {
		$queried_object = get_queried_object();
		$link = get_term_link( $queried_object->slug, $queried_object->taxonomy );
	}

	// Min/Max.
	if ( isset( $_GET['min_price'] ) ) {
		$link = add_query_arg( 'min_price', wc_clean( wp_unslash( $_GET['min_price'] ) ), $link );
	}

	if ( isset( $_GET['max_price'] ) ) {
		$link = add_query_arg( 'max_price', wc_clean( wp_unslash( $_GET['max_price'] ) ), $link );
	}

	// Order by.
	if ( isset( $_GET['orderby'] ) ) {
		$link = add_query_arg( 'orderby', wc_clean( wp_unslash( $_GET['orderby'] ) ), $link );
	}

	/**
	 * Search Arg.
	 * To support quote characters, first they are decoded from &quot; entities, then URL encoded.
	 */
	if ( get_search_query() ) {
		$link = add_query_arg( 's', rawurlencode( htmlspecialchars_decode( get_search_query() ) ), $link );
	}

	// Post Type Arg.
	if ( isset( $_GET['post_type'] ) ) {
		$link = add_query_arg( 'post_type', wc_clean( wp_unslash( $_GET['post_type'] ) ), $link );
	}

	// Min Rating Arg.
	if ( isset( $_GET['rating_filter'] ) ) {
		$link = add_query_arg( 'rating_filter', wc_clean( wp_unslash( $_GET['rating_filter'] ) ), $link );
	}

	// All current filters.
	if ( $_chosen_attributes = WC_Query::get_layered_nav_chosen_attributes() ) {
		foreach ( $_chosen_attributes as $name => $data ) {
			$filter_name = sanitize_title( str_replace( 'pa_', '', $name ) );
			if ( ! empty( $data['terms'] ) ) {
				$link = add_query_arg( 'filter_' . $filter_name, implode( ',', $data['terms'] ), $link );
			}
			if ( 'or' == $data['query_type'] ) {
				$link = add_query_arg( 'query_type_' . $filter_name, 'or', $link );
			}
		}
	}

	return $link;
}

add_filter('woocommerce_pagination_args', 'hpy_pagination_args' );
function hpy_pagination_args( $qrgs ){
	$args['prev_text'] = get_hpy_svg('arrow-left') . __('Prev','hpy');
	$args['next_text'] = __('Next','hpy') . get_hpy_svg('arrow-right');
	return $args;
}

add_filter('woocommerce_single_product_image_thumbnail_html', 'strip_anchor_tags', 2, 10 );
function strip_anchor_tags( $html, $id ){
	return preg_replace( "/<\\/?a(\\s+.*?>|>)/", "", $html );
}

function add_main_main_image_to_gallery(){
	global $product;
	$post_thumbnail_id = $product->get_image_id();

	if ( has_post_thumbnail() ) {
		$html  = wc_get_gallery_image_html( $post_thumbnail_id, true );
	} else {
		$html  = '<div class="woocommerce-product-gallery__image--placeholder">';
		$html .= sprintf( '<img src="%s" alt="%s" class="wp-post-image" />', esc_url( wc_placeholder_img_src() ), esc_html__( 'Awaiting product image', 'woocommerce' ) );
		$html .= '</div>';
	}

	echo apply_filters( 'woocommerce_single_product_image_thumbnail_html', $html, $post_thumbnail_id );
}

/**
 * Get HTML for a gallery image.
 *
 * woocommerce_gallery_thumbnail_size, woocommerce_gallery_image_size and woocommerce_gallery_full_size accept name based image sizes, or an array of width/height values.
 *
 * @since 3.3.2
 * @param int $attachment_id
 * @param bool $main_image Is this the main image or a thumbnail?
 * @return string
 */
function hpy_get_gallery_image_html( $attachment_id, $gallery_rel, $main_image = false ) {
	$flexslider        = (bool) apply_filters( 'woocommerce_single_product_flexslider_enabled', get_theme_support( 'wc-product-gallery-slider' ) );
	$gallery_thumbnail = wc_get_image_size( 'gallery_thumbnail' );
	$thumbnail_size    = apply_filters( 'woocommerce_gallery_thumbnail_size', array( $gallery_thumbnail['width'], $gallery_thumbnail['height'] ) );
	$image_size        = apply_filters( 'woocommerce_gallery_image_size', $flexslider || $main_image ? 'woocommerce_single': $thumbnail_size );
	$full_size         = apply_filters( 'woocommerce_gallery_full_size', apply_filters( 'woocommerce_product_thumbnails_large_size', 'full' ) );
	$thumbnail_src     = wp_get_attachment_image_src( $attachment_id, $thumbnail_size );
	$full_src          = wp_get_attachment_image_src( $attachment_id, $full_size );
	$image             = wp_get_attachment_image( $attachment_id, $image_size, false, array(
		'title'                   => get_post_field( 'post_title', $attachment_id ),
		'data-caption'            => get_post_field( 'post_excerpt', $attachment_id ),
		'data-src'                => $full_src[0],
		'data-large_image'        => $full_src[0],
		'data-large_image_width'  => $full_src[1],
		'data-large_image_height' => $full_src[2],
		'class'                   => $main_image ? 'wp-post-image' : '',
	) );

	return '<div data-thumb="' . esc_url( $thumbnail_src[0] ) . '" class="woocommerce-product-gallery__image"><a href="' . esc_url( $full_src[0] ) . '" data-fancybox="' . $gallery_rel . '">' . $image . '</a></div>';
}

function hpy_get_variation_selectables( $attribute_name, $options, $product, $selected ){
	if ( $product && taxonomy_exists( $attribute_name ) ) {
		$children = $product->get_children();
		$terms = array();
		$variation_display_order = 'price';
		if (get_field('variant_display_order', $product->get_id()) != '') {
			$variation_display_order = get_field('variant_display_order', $product->get_id());
		}
		$i = 0;
		foreach ($children as $child) {
			$_child = wc_get_product( $child );
			$attribute = array_shift( $_child->get_attributes() );
			$term = get_term_by( 'slug', $attribute, $attribute_name );
			if ( $term ) {
				$terms[$i]['slug'] = $term->slug;
				$terms[$i]['price'] = $_child->get_price();
				$terms[$i]['name'] = $term->name;
				$terms[$i]['description'] = $term->description;
				$terms[$i]['variant_id'] = $_child->get_id();
				$terms[$i] = (object) $terms[$i];
				$i++;
			}
		}
		
		if ( !empty( $terms ) ) {
			if ($variation_display_order == 'price') {
				usort($terms, function($a, $b) {
					return $a->price - $b->price;
				});
			} else {
				asort($terms, function($a, $b) {
					return $a->price - $b->price;
				});
			}
			
			$terms = (object) $terms;
		}

		$layout = get_product_display_setting();
		if( is_null( $layout ) ){
			$layout = 'default';
		}
	
		if( $layout != 'bullet' ) :
			$prices = get_term_price_difference( $terms );
			$class = 'product_variant_options normal_variations';
			if( $layout == 'finish' ){
				$class .= ' hpy_finishing_variant';
			}
			

			?><fieldset class="<?php echo $class; ?>" data-variant="<?php echo sanitize_title( $attribute_name ); ?>">
				<legend class="screen-reader-text"><?php echo wc_attribute_label( $attribute_name ); ?></legend>
				<span class="product_variants_tabs">
					<?php foreach( $terms as $term ) :
						$tag = get_variant_product_label_tag( $term );
						?><label <?php echo false !== $tag ? ' class="has-tag"' : '' ; ?> data-price="<?php echo get_variant_product_price( $term, false ); ?>">
							<input type="radio" name="hpy_attr_<?php echo sanitize_title( $attribute_name ); ?>" value="<?php echo $term->slug; ?>"<?php echo ( $selected == $term->slug ) ? ' checked="checked"' : ''; ?>>
							<span class="prd_variant_line_wrap">
								<span class="radio-check"><?php hpy_svg('tick'); ?></span>
								<?php if ( false !== $tag ) : ?>
									<span class="prd_variant_line_tag_icon"><?php hpy_svg('medal'); ?></span>
								<?php endif; ?>
								<span class="prd_variant_line">
									<span class="attr_title"><?php echo esc_html( $term->name ) . ( $prices[$term->name] != '' ? '<span class="variant-additional-price">' . $prices[$term->name] . '</span>' : '' ); ?></span>
									<?php echo false !== $tag ? $tag : '' ; ?>
								</span>
							</span>
						</label>
					<?php endforeach; ?>
				</span>
			</fieldset><?php

		else :
			$class = 'product_variant_options football_variations';

			?><fieldset class="<?php echo $class; ?>" data-variant="<?php echo sanitize_title( $attribute_name ); ?>">
				<legend class="screen-reader-text"><?php echo wc_attribute_label( $attribute_name ); ?></legend>
				<?php foreach( $terms as $term ) : ?>
					<label>
						<input type="radio" name="hpy_attr_<?php echo sanitize_title( $attribute_name ); ?>" value="<?php echo $term->slug; ?>"<?php echo ( $selected == $term->slug ) ? ' checked="checked"' : ''; ?>>
						<span class="prd_variant_line">
							<span class="radio-check"><?php hpy_svg('tick-icon'); ?></span>
							<span class="attr_title"><?php echo esc_html( $term->name ); ?></span>
							<?php echo get_variant_product_label_tag( $term ); ?>
							<?php get_variant_product_price( $term, true ); ?>
						</span>
						<?php get_variant_product_description( $term ); ?>
					</label>
				<?php endforeach; ?>
			</fieldset><?php

		endif;
	}
}

function get_term_price_difference( $terms ){
	$prices = array();

	// get the first element as we're passing on ordered list of terms the first term will be the cheapest
	$terms_array = (array) $terms;
	$cheapest = $terms_array[0]->price;

	foreach( $terms as $term ){
		$price = get_variant_product_price( $term );
		if ( $price > $cheapest ){
			$p = floatVal( $price - $cheapest );
			$prices[ $term->name ] = '+' . get_woocommerce_currency_symbol() . $p;
		}else{
			$prices[ $term->name ] = '';
		}
	}

	return $prices;
}

function get_variant_product_label_tag( $term ){
	$tag_text = get_post_meta( $term->variant_id, 'tag_text', true );

	if ( !empty( $tag_text ) ) {

		$class = 'variant-label';
		$type = get_post_meta( $term->variant_id, 'tag_class', true );;

		switch ($type) {
			case 'red':
				$class .= ' red-label';
				break;
			case 'yellow':
				$class .= ' yellow-label';
				break;
			case 'green':
				$class .= ' green-label';
				break;
			case 'blue':
				$class .= ' blue-label';
				break;
			case 'grey':
				$class .= ' grey-label';
				break;
			default:
				$class .= ' blue-label';
				break;
		}

		ob_start();

		?><span class="<?php echo $class; ?>"><?php echo $tag_text; ?></span><?php

		return ob_get_clean();
	}

	return false;
}

function get_variant_product_price( $term, $echo = false ){
		global $wpdb, $product;

		$query = "SELECT postmeta.post_id AS product_id
		FROM {$wpdb->prefix}postmeta AS postmeta
			LEFT JOIN {$wpdb->prefix}posts AS products ON ( products.ID = postmeta.post_id )
		WHERE postmeta.meta_key LIKE 'attribute_%'
			AND postmeta.meta_value = '$term->slug'
			AND products.post_parent = $product->id";

		$variation_id = $wpdb->get_col( $query );

		$_product = new WC_Product_Variation( $variation_id[0] );
		if( $echo ){
			echo $_product->get_price_html();
		}else{
			return floatVal( $_product->get_price() );
		}

	return false;
}

function get_variant_product_description( $term ){

	global $product;

	$_prod = wc_get_product( $term->variant_id );
	$content = $_prod->get_description();

	if ( 'bullet' == get_product_display_setting() ) {
		if ( ! empty( $term->description ) ) {

			$description = $content ? $content : $term->description;
			$points = explode(PHP_EOL, $description);
			echo '<span class="attr_desc"><ul>';
				foreach ($points as $point) { 
					preg_match( '/\bfree\b/i', $point, $matches ); ?>
					<li <?php echo ! empty( $matches ) ? 'class="attr_desc_free"': ''; ?>><?php
						hpy_svg('tick-icon');
						

						echo $point;
						
					?></li><?php
				}
			echo '</ul></span>';
		}
	}
}

add_filter( 'woocommerce_output_related_products_args', 'hpy_related_products_args' );
  function hpy_related_products_args( $args ) {
	$args['posts_per_page'] = 6; // 4 related products
	return $args;
}


function hpy_sg_override_email_if_set_in_session( $fields ) {

	global $woocommerce;
	$wc_session = $woocommerce->session;

	$guest_email = $wc_session->get( 'hpy_guest_email' );

//	$user = wp_get_current_user();
	
	if ( !is_user_privileged() ) {
		if (isset($guest_email) && !empty($guest_email)) {
			$fields['billing']['billing_email']['placeholder'] = $guest_email;
			$fields['shipping']['shipping_email']['placeholder'] = $guest_email;
		}
	}
	

//	if ( !is_user_privileged() ) {
//		if (!empty(WC()->customer->get_billing_email()) || !empty($guest_email)) {
//			$fields['billing']['billing_email']['class'][] = 'hidden';
//			$fields['shipping']['shipping_email']['class'][] = 'hidden';
//		}
//	}

	return $fields;

}
add_filter( 'woocommerce_checkout_fields' , 'hpy_sg_override_email_if_set_in_session' );


add_filter( 'woocommerce_checkout_get_value', 'hpy_woocommerce_checkout_get_value', 10, 2 );
function hpy_woocommerce_checkout_get_value( $input, $key ) {

	global $woocommerce;
	$wc_session = $woocommerce->session;

	if ( !is_user_privileged() ) {
		$guest_email = $wc_session->get('hpy_guest_email');
		$email = array(
			'shipping' => is_user_logged_in() ? get_user_meta(get_current_user_id(), 'shipping_email', true) : $guest_email,
			'billing' => is_user_logged_in() ? get_user_meta(get_current_user_id(), 'billing_email', true) : $guest_email,
		);
	} else {
		$email = array(
			'shipping' => '',
			'billing' => '',
		);
	}
		
		
	switch ($key) {
		case 'shipping_email' :
			return $email['shipping'];
			break;
		case 'billing_email' :
			return $email['billing'];
			break;
	}

}


/**
 * Add a from prefix to variable products if the variants have different prices
 * @link https://iconicwp.com/blog/change-price-range-variable-products-woocommerce/
 */
function hpy_variable_price_format( $price, $product ) {

    $prefix =  sprintf('<span class="price-from">%s</span> ', __('From', 'hpy'));

    $min_price_regular = number_format((float) $product->get_variation_regular_price( 'min', true ), 2, '.', '');
    $min_price_sale    = number_format((float) $product->get_variation_sale_price( 'min', true ), 2, '.', '');
    $max_price = number_format((float) $product->get_variation_price( 'max', true ), 2, '.', '');
	$min_price = number_format((float) $product->get_variation_price( 'min', true ), 2, '.', '');

	if( $min_price_sale == $min_price_regular ){
		$price = $min_price == $max_price ? wc_price( $min_price_regular ) : sprintf('%s%s', $prefix, wc_price( $min_price_regular ));
	}else{
		$price = '<del>' . ( is_product() ? sprintf( '%s: ', __('Was', 'hpy') ) : '' ) . wc_price( $min_price_regular ) . '</del><ins>';

		$price .= $min_price == $max_price ? wc_price( $min_price_sale ) : sprintf( '%s%s', $prefix, wc_price( $min_price_sale ) );

		$price .= '</ins>';
	}

    return $price;

}
add_filter( 'woocommerce_variable_sale_price_html', 'hpy_variable_price_format', 10, 2 );
add_filter( 'woocommerce_variable_price_html', 'hpy_variable_price_format', 10, 2 );

/**
 * Add a from prefix for ONJ
 */
function hpy_simple_price_format( $price, $product ){
	if (get_field('template_type', $product->ID) == 'onj' && !get_field('override_newspaper_selection_price', $product->ID)) {
    	return 'From: '.$price;
	}
	return $price;
}
add_filter('woocommerce_get_price_html', 'hpy_simple_price_format', 100, 2);

add_filter('woocommerce_format_sale_price', 'hn_format_sale_price', 100, 3);
function hn_format_sale_price( $price, $regular_price, $sale_price ){
	$hn_price = '<del>was ' . ( is_numeric( $regular_price ) ? wc_price( $regular_price ) : $regular_price ) . '</del> <ins> - Now ' . ( is_numeric( $sale_price ) ? wc_price( $sale_price ) : $sale_price ) . '</ins>';
	return $hn_price;
}
/**
 * Add tabs to product pages
 */

add_filter( 'woocommerce_product_tabs', 'woo_new_product_tab' );
function woo_new_product_tab( $tabs ) {
	global $post;
	$tabs['description']= array(
		'title' 	=> sprintf( '%s', __( 'Product Description', 'woocommerce' ) ),
		'priority' 	=> 10,
		'callback' 	=> 'itb_tab_product_details'
	);

	$tabs['delivery_tab'] = array(
		'title' 	=> sprintf( '%s', __( 'Delivery Information', 'woocommerce' ) ),
		'priority' 	=> 20,
		'callback' 	=> 'itb_tab_delivery_information_tab'
	);

	if( class_exists('acf') ){
		$total = HPY_ITB_Trustpilot_API::get_product_review_total_meta( $post->ID );
		if( HPY_ITB_Trustpilot_API::reviews_enabled() && $total > 0 ){
			$tabs['reviews'] = array(
				'title' => sprintf( '%s',  __( 'Product Reviews', 'woocommerce' ) ),
				'priority' => 30,
				'callback' 	=> 'itb_tab_reviews'
			);
		}else{
			unset( $tabs['reviews'] );
		}

		if( HPY_ITB_Trustpilot_API::business_reviews_enabled() ){
			// check here for testimonials actually existing
			$tabs['testimonials'] = array(
				'title' => sprintf( '%s',  __( 'Testimonials', 'woocommerce' ) ),
				'priority' => 40,
				'callback' 	=> 'hn_sidebar_testimonials'
			);
		}


	}

	unset( $tabs['additional_information'] );

	return $tabs;

}

add_filter( 'woocommerce_product_description_tab_title', 'hpy_add_description_tab_icon', 10, 2);
function hpy_add_description_tab_icon( $output, $key ){
    return get_hpy_svg('book') . $output;
}

add_filter( 'woocommerce_product_delivery_tab_tab_title', 'hpy_add_delivery_tab_icon', 10, 2);
function hpy_add_delivery_tab_icon( $output, $key ){
    return get_hpy_svg('delivery') . $output;
}

add_filter( 'woocommerce_product_reviews_tab_title', 'hpy_add_reviews_tab_icon', 10, 2);
function hpy_add_reviews_tab_icon( $output, $key ){
    return get_hpy_svg('star') . $output;
}

add_filter( 'woocommerce_product_testimonials_tab_title', 'hpy_add_testimonials_tab_icon', 10, 2);
function hpy_add_testimonials_tab_icon( $output, $key ){
    return get_hpy_svg('speech') . $output;
}

function itb_tab_product_details(){
	global $post, $product;

	?>
	<div class="tabs-content-wrap-left entry-content"><?php
		echo apply_filters( 'the_content', $post->post_content );

		if( $product->is_type( 'variable' ) ){
			echo '<p id="variable_isbn" style="display:none"></p>';
		} else {
			$ISBN = get_post_meta( $post->ID, '_cpf_ean', true );
			if( ! empty( $ISBN ) ){
				echo '<p>' . $ISBN . '</p>';
			}
		}
	?>
	</div>
	<div class="tabs-content-wrap-right products-right-tab"><?php
		$cover = get_field( 'product_cover', $post->ID );

		if($product->is_type('variable')){
			$variations = $product->get_available_variations();
			$width = $variations[0]['dimensions']['width'];
			$height = $variations[0]['dimensions']['length'];
		}else{
			$width = floatval( $product->get_width() );
			$height = floatval( $product->get_length() );
		}

		if( ! empty( $cover ) && $width > 0 && $height > 0 ){
			$measurement = hpy_itb_is_uk_site() ? 'mm' : 'ins'; ?>
			<div class="hpy_prd_cover_image_wrap">
				<div class="hpy_prd_cover_image">
					<div class="hpy_prd_cover_width"><span><?php echo $width . $measurement; ?></span></div>
					<?php echo hpy_image( $cover, 'full' ); ?>
					<div class="hpy_prd_cover_height"><span><?php echo $height . $measurement; ?></span></div>
				</div>
			</div><?php
		}

		woocommerce_output_related_products();
	?></div><?php
}

function itb_tab_delivery_information_tab() {
	global $product; ?>
	<div class="tabs-content-wrap-full entry-content"><?php
		$page = get_field( 'delivery_details_page', 'option' );
		echo apply_filters( 'the_content', $page->post_content ); ?>
	</div><?php
}

function itb_tab_reviews(){
	global $post;
	?>
	<div class="tabs-content-wrap-left entry-content">
		<header class="review_content_header">
			<h2 class="tab-title"><?php esc_html_e( 'See what our customers have to say', 'hpy' ); ?></h2>
			<?php HPY_ITB_Trustpilot_API::output_review_tab_rating( $post->ID ) ?>
		</header>
		<?php echo get_field('review_tab_content', 'options'); ?>
	</div>
	<div class="tabs-content-wrap-right"><?php HPY_ITB_Trustpilot_API::output_product_reviews( 1, $post->ID ); ?></div><?php

}

function hn_sidebar_testimonials(){ 
	global $post, $product;
	if (!detect_onj($product)) {
		return;
	}
	?>
	<div class="testimonial-top" id="tab-reviews">
		<div class="trust-pilot-reviews">
			<?php HPY_ITB_Trustpilot_API::output_review_tab_rating( $post->ID ) ?>
		</div>
		<?php
		$link = get_field( 'testimonial_link' ,'options' );
		if( ! empty( $link ) ){
			itb_button('a', __('See Testimonials', 'hpy'), array(
				'href' => $link,
				'class' => 'lightblue-button show-mdlg-min',
				'target' => '_blank'
			) );
		} ?>
	</div>
	<div class="testimonial-bottom">
		<?php HPY_ITB_Trustpilot_API::output_product_reviews( 1, $post->ID ); ?>
	</div><?php
}

// duplicate of the above, but to show in the right column
// duplicate needed so we can check for ONJ
function hn_sidebar_testimonials_right(){ 
	global $post, $product;
	if (detect_onj($product)) {
		return;
	}
	?>
	<div class="testimonial-top" id="tab-reviews">
		<div class="trust-pilot-reviews">
			<?php HPY_ITB_Trustpilot_API::output_review_tab_rating( $post->ID ) ?>
		</div>
		<?php
		$link = get_field( 'testimonial_link' ,'options' );
		if( ! empty( $link ) ){
			itb_button('a', __('See Testimonials', 'hpy'), array(
				'href' => $link,
				'class' => 'lightblue-button show-mdlg-min',
				'target' => '_blank'
			) );
		} ?>
	</div>
	<div class="testimonial-bottom">
		<?php HPY_ITB_Trustpilot_API::output_product_reviews( 1, $post->ID ); ?>
	</div><?php
}

add_filter( 'woocommerce_output_related_products_args', 'itb_related_products_args' );
function itb_related_products_args( $args ) {
	$args['posts_per_page'] = 6;
	$args['columns'] = 3;
	return $args;
}

add_filter( 'woocommerce_product_single_add_to_cart_text', 'hpy_add_to_cart_text' );
function hpy_add_to_cart_text() {
    return __( 'Add to Basket', 'hpy' );
}

/**
 * @link https://stackoverflow.com/questions/14757373/how-to-disable-the-quantity-field-in-the-product-detail-page-in-woocommerce
 */
/*function wc_remove_all_quantity_fields( $return, $product ) {
    return true;
}
add_filter( 'woocommerce_is_sold_individually', 'wc_remove_all_quantity_fields', 10, 2 );*/

function itb_youtube_video_link(){
	global $product;

	if( class_exists('acf') ){
		$youtube_link = get_field( 'youtube_link', $product->get_id() );
		if( ! empty( $youtube_link ) ){
			$class = 'itb_youtube_product_link hpy_ga_ta_ev';
			echo '<a data-fancybox href="' . $youtube_link . '" target="_blank" class="' . $class . '" data-category="Video" data-action="Click" data-label="' . substr( $product->get_name(), 0, 500 ) . '">' . get_hpy_svg('youtube'). __('Watch the Video', 'hpy') . '</a>';
		}
	}
}

function itb_one_day_delivery_notice( $class = '' ) {
	global $product;

	if ( $product->get_shipping_class() !== 'selected-date-books' ) {
		$display = apply_filters('hpy_itb_display_one_day_delivery', true);
		if ($display) { ?>
		<div class="itb_one_day_delivery_notice <?php echo $class; ?>">
			<div class="row">
				<div class="itb_notice_icon">
					<?php hpy_svg('delivery'); ?>
				</div>
				<div class="itb_notice_content">
					<strong><?php _e('Next day delivery available', 'hpy'); ?></strong>
					<em>on orders placed before 11am</em>
					<span>Select <strong>Urgent</strong> delivery at checkout</span>
				</div>
			</div>
			</div><?php
		}
	}
}

function get_category_description(){
	
	if ( is_search() ) {
		return;
	}

	if ( is_post_type_archive( 'product' ) && 0 === absint( get_query_var( 'paged' ) ) ) {
		$shop_page = get_post( wc_get_page_id( 'shop' ) );
		if ( $shop_page ) {
			$description = wc_format_content( $shop_page->post_content );
			if ( $description ) {
				echo '<div class="page-description">' . get_first_sentence( $description ) . '</div>'; // WPCS: XSS ok.
			}
		}
	}

	if ( is_product_taxonomy() && 0 === absint( get_query_var( 'paged' ) ) ) {
		$term = get_queried_object();

		if ( $term && ! empty( $term->description ) ) {
			$new_description = $term->description;
			if ( isset($_ENV['SITE_CODE']) && $_ENV['SITE_CODE'] == "us") {
				// scan term->description to localise personalisation
				$new_description = str_replace("personalised", "personalized" ,$term->description);
			}
			echo '<div class="term-description">' . wc_format_content( $new_description ) . '</div>'; // WPCS: XSS ok.
		}
	}
}

function get_first_sentence( $string ){
	return substr( $string, 0, strpos( $string, "</p>" ) +4 );
}

function get_all_but_first_sentence( $string ){
	$first = get_first_sentence( $string );
	return str_replace( $first , '', $string );
}

/**
 * Thank you Page functions
 */

/**
 * Output the Expected delivery date
 * Takes into account Lead times and Delivery Times. Uses the lowest of a range, but the highest option is multiple lead times.
 *
 * @param string $ship_method
 * @param $order
 * @param string $type
 * @param string $date_format
 *
 * @return bool|string
 */
function hpy_itb_get_estimated_delivery_date( $ship_method = '', $order, $type = 'cart', $date_format = 'd/m/Y' ) {

	if( defined('LOCAL_DEV') && LOCAL_DEV === true ){
		return '';
	}

	if ( $type == 'order' ) {
		$order_date = $order->get_date_paid() ? date( $date_format, strtotime( $order->get_date_paid() ) ) : date( $date_format, strtotime( "NOW" ) );
	} else {
		$order_date = date( $date_format, strtotime( "NOW" ) );
	}

	switch( $type ) {
		case 'cart' :
			$order_items = $order->get_cart();
			$shipping_method = WC()->session->get( 'chosen_shipping_methods' );
			$urgent = ( strpos( strtolower( $ship_method->get_label() ), 'urgent' ) !== false ) ? true : false;
			break;

		case 'order' :
			$order_items = $order->get_items( apply_filters( 'woocommerce_purchase_order_item_types', 'line_item' ) );
			$shipping_method = $order->get_items( apply_filters( 'hpy_itb_shipping_zones', 'shipping' ) );
			$urgent = ( strpos( strtolower( $order->get_shipping_method() ), 'urgent' ) !== false ) ? true : false;
			break;

		default :
			$order_items = $order->get_cart();
			$shipping_method = WC()->session->get( 'chosen_shipping_methods' );
			$urgent = ( strpos( strtolower( $ship_method->get_label() ), 'urgent' ) !== false ) ? true : false;
			break;
	}
	$hpy_itb_shipping_options = get_option( 'hpy_itb_shipping_lead_settings' );
	$estimates = array();
	$shipping_method_id = array();

	if ( isset( $ship_method ) && !empty( $ship_method ) ) {
		$shipping_method_id[] = $ship_method->get_method_id() . ':' . $ship_method->get_instance_id();
	} else {
		foreach ( $shipping_method as $method ) {
			if ( ! is_string( $method ) ) {
				$shipping_method_id[] = $method->get_method_id() . ':' . $method->get_instance_id();
			} else {
				$shipping_method_id[] = $method;
			}
		}
	}

	$shipping_method_id = array_shift( array_unique( $shipping_method_id ) );

	foreach( $order_items as $item ) {
		if ( !is_array( $item ) ) {
			$id = $item->get_variation_id() ? $item->get_variation_id() : $item->get_product_id();
		} else {
			$id = $item['variation_id'] ? $item['variation_id'] : $item['product_id'];
		}
		$_prod = wc_get_product( $id );
		$shipping_class = $_prod->get_shipping_class();

		if ( !empty( $ship_method ) ) {
			if ( strpos( strtolower( $ship_method->get_label() ), 'urgent' ) !== false ) {
				$default = $hpy_itb_shipping_options[$shipping_class]['urgent'] ? $hpy_itb_shipping_options[$shipping_class]['urgent'] : $hpy_itb_shipping_options[$shipping_class]['standard'];
			} else {
				$default = $hpy_itb_shipping_options[$shipping_class]['standard'];
			}
		} else {
			$product = wc_get_product( $id );
			$default = ( hpy_itb_get_dispatch_range($product, '', $urgent) ) ? hpy_itb_get_dispatch_range($product, '', $urgent) : '1 - 3 days';
		}

		if ( $shipping_class = 'selected-date-books' ) {
			$leadtime = hpy_itb_get_quickest_day($default ? $default : get_post_meta($id, '_hpy_lead_time', true));
			$end_leadtime = hpy_itb_get_longest_day($default ? $default : get_post_meta($id, '_hpy_lead_time', true));
		} else {
			$leadtime = hpy_itb_get_quickest_day(get_post_meta($id, '_hpy_lead_time', true) ? get_post_meta($id, '_hpy_lead_time', true) : $default);
			$end_leadtime = hpy_itb_get_longest_day(get_post_meta($id, '_hpy_lead_time', true) ? get_post_meta($id, '_hpy_lead_time', true) : $default);
		}

		if ( empty( $ship_method ) ) {
			foreach( $shipping_method as $key => $value ) {
				$label = $value->get_name();
			}
		} else {
			$label = $ship_method->get_label();
		}
		if ( strpos( strtolower( $label ), 'urgent' ) !== false ) {
			if ( (int) $end_leadtime > 1 ) {
				$end_leadtime = (string) $end_leadtime - 1;
			}
		}

		$estimates[ 'lead_end' ][] = hpy_itb_get_longest_day( $end_leadtime );
		$estimates[ 'lead' ][] = hpy_itb_get_quickest_day( $leadtime );
		$estimates[ 'delivery' ][] = hpy_itb_get_quickest_day( $hpy_itb_shipping_options[$shipping_method_id] );
		$estimates[ 'delivery_end' ][] = hpy_itb_get_longest_day( $hpy_itb_shipping_options[$shipping_method_id] );
	}

	if ( hpy_itb_is_uk_site() ) {
		if (date('H') < 12) {
			$lead_end = (int)$estimates['lead_end'][0];
			$lead_end--;
			$estimates['lead_end'][0] = $lead_end;
		}
	}

	$addition = intval( max( $estimates['lead_end'] ) ) + intval( max( $estimates[ 'delivery_end' ] ) );
	$holiday_class = new HPY_ITB_Bankholidays();
	$holidays = $holiday_class->hpy_itb_all_bankholidays( $date_format );

	$beginning_date = date( $date_format, strtotime( str_replace( '/', '-', $order_date ) ) );
	$estimate_date = date( $date_format, strtotime( str_replace( '/', '-', $order_date ) . ' +' . $addition . 'weekdays' ) );

	$estimate_date = $holiday_class->hpy_itb_account_bankholidays( $beginning_date, $estimate_date, $holidays, $date_format );

	$estimate_date = $holiday_class->hpy_next_working_day_check(  date( $date_format, strtotime( str_replace ( '/', '-', $estimate_date ) ) ), $holidays, $date_format );

	return $estimate_date;
}

function order_item_shipping_method($order_id){
	global $woocommerce;
	new WC_Order($order_id);
	
	$countries = WC()->countries->get_countries();
	$cdefaults = array();
	if ( hpy_itb_is_uk_site() ) {
		$currencies = array( 'GB' => 'GBP', 'IE' => 'EUR', 'AU' => 'AUD' );
		$defaults = array( 'GB' => 'GB', 'IE' => 'IE', 'AU' => 'AU' );
		$style = 'style="display:none;"';
	} else {
		$currencies = array( 'US' => 'USD', 'CA' => 'CAD' );
		$defaults = array( 'US' => 'US', 'CA' => 'CA' );
		$style = '';
	}
	if ( hpy_itb_get_current_currency() == 'USD' ) {
		$country = 'US';
		$state = 'AL';
	} else {
		$country = array_search( hpy_itb_get_current_currency(), $currencies );
		$state = '';
	}
	
	$rangesCompare = '';
	foreach( WC()->cart->get_cart() as $cart_item ) {
		
		$_product =  wc_get_product( $cart_item['data']->get_id());
		$p_id = '';
		$p_id = $cart_item['data']->get_id();
		
		$ranges = hpy_itb_get_delivery($country, $state, 'load', $p_id);
		if($rangesCompare != ''){
			$rangesCompare = array_different_check($rangesCompare, $ranges);
		}else{
			$rangesCompare = $ranges;
		}
	}
}

/**
 * Calculate the estimated Date Range.
 *
 * @param $method
 * @param $order
 * @param string $type
 * @param string $date_format
 * @param array $ranges
 * @return mixed|string
 */
function hpy_itb_get_delivery_range( $method, $order, $type = 'cart', $date_format = 'jS F', $ranges = array() ) {
	global $wp_query, $productShipping;
	$hpy_itb_shipping_options = get_option( 'hpy_itb_shipping_lead_settings' );
	$production_ranges = array();
	if ( $type == 'shortcode' ) {
		$method_id = $method->id . ':' . $method->get_instance_id();
		$method_title = $method->title;
	} else if ( $type == 'order' ) {
		$method_id = $method->get_method_id() . ':' . $method->get_instance_id();
		$method_title = $method->get_method_title();
	} else if ( $wp_query->queried_object->post_name == 'basket' ) {
		$method_id = $method->get_method_id() . ':' . $method->get_instance_id();
		$method_title = $method->get_label();
	} else {
		$method_id = $method->get_method_id() . ':' . $method->get_instance_id();
		$method_title = $method->get_label();
	}

	if ( $type == 'order' ) {
		$order_date = $order->get_date_paid() ? date( $date_format, strtotime( $order->get_date_paid() ) ) : date( $date_format, strtotime( "NOW" ) );
	} else {
		$order_date = date( $date_format, strtotime( "NOW" ) );
	}

	if ( $type == 'shortcode' ) {
		$shipping_class = $order->get_shipping_class();
	} else if ( $type == 'order' ) {
		foreach( $order->get_items() as $key => $value ) {
			$_product = wc_get_product( $value['variation_id'] ? $value['variation_id'] : $value['product_id'] );
			if ( $_product instanceof WC_Product ) {
				$shipping_classes[$key] = $_product->get_shipping_class();
				$shipping_class = $_product->get_shipping_class();
			}
		}
	} else if( $wp_query->queried_object->post_name == 'basket' ) {
		foreach( $order->get_cart_contents() as $key => $value ) {
			$_product = wc_get_product( $value['variation_id'] ? $value['variation_id'] : $value['product_id'] );
			$shipping_classes[$key] = $_product->get_shipping_class();
		}
	} else {
		foreach( $order->get_cart_contents() as $key => $value ) {
			$_product = wc_get_product( $value['variation_id'] ? $value['variation_id'] : $value['product_id'] );
			$shipping_classes[$key] = $_product->get_shipping_class();
		}
	}

	if ( !empty( $shipping_class ) || !empty($shipping_classes) ) {
		if ( is_array( $shipping_classes ) ) {
			foreach( $shipping_classes as $class ) {
				if ($method_title == 'Urgent' || $method_title == 'Urgent (Courier)' || $method_title == 'Urgent Signed For (Courier)') {
					$production_ranges[] = $hpy_itb_shipping_options[$class]['urgent'] ? $hpy_itb_shipping_options[$class]['urgent'] : 'standard -1';
				} else {
					$production_ranges[] = $hpy_itb_shipping_options[$class]['standard'];
				}
			}
		} else {
			if ($method_title == 'Urgent' || $method_title == 'Urgent (Courier)' || $method_title == 'Urgent Signed For (Courier)') {
				$production_range = $hpy_itb_shipping_options[$shipping_class]['urgent'] ? $hpy_itb_shipping_options[$shipping_class]['urgent'] : 'standard -1';
			} else {
				$production_range = $hpy_itb_shipping_options[$shipping_class]['standard'];
			}
		}
	} else {
		$production_range = $hpy_itb_shipping_options[$method_id]['production'];
	}

	$delivery_range = $hpy_itb_shipping_options[$method_id]['delivery'];

	if ( empty( $production_range ) ) {
		$production_range = $hpy_itb_shipping_options[$method_id]['production'];
	}

	if ( is_array( $production_ranges ) && !empty( $production_ranges ) ) {
		$production_range = hpy_itb_get_highest_range( array_unique( array_filter( $production_ranges ) ) );
		$ranges['lowest']['production'] = $production_range ? hpy_itb_get_quickest_day($production_range) : '3';
		$ranges['highest']['production'] = $production_range ? hpy_itb_get_longest_day($production_range) : '4';
	} else {
		if ($production_range == 'standard -1') {
			$ranges['lowest']['production'] = hpy_itb_get_quickest_day($hpy_itb_shipping_options[$shipping_class]['standard']) - 1;
			$ranges['highest']['production'] = hpy_itb_get_longest_day($hpy_itb_shipping_options[$shipping_class]['standard']) - 1;
		} else {
			$ranges['lowest']['production'] = $production_range ? hpy_itb_get_quickest_day($production_range) : '3';
			$ranges['highest']['production'] = $production_range ? hpy_itb_get_longest_day($production_range) : '4';
		}
	}

	$ranges['lowest']['delivery'] = $delivery_range ? hpy_itb_get_quickest_day( $delivery_range ) : '';
	$ranges['highest']['delivery'] = $delivery_range ? hpy_itb_get_longest_day( $delivery_range ) : '';

	$min_addition = intval( $ranges['lowest']['production'] ) + intval( $ranges['lowest']['delivery'] );
	$max_addition = intval( $ranges['highest']['production'] ) + intval( $ranges['highest']['delivery'] );

	$additions = array( 'min' => $min_addition, 'max' => $max_addition, 'min_production' => intval( $ranges['lowest']['production'] ), 'max_production' => intval( $ranges['highest']['production'] ));

	foreach( $additions as $akey => $avalue ) {
		if ( hpy_itb_is_uk_site() ) {
			date_default_timezone_set('Europe/London');
		} else {
			date_default_timezone_set('America/New_York');
		}

		if (date('H') < 12 && !in_array( date('D'), array('Sat', 'Sun') ) ) {
			$additions[$akey] = $avalue - 1;
		}
	}

	$holiday_class = new HPY_ITB_Bankholidays();
	$holidays = $holiday_class->hpy_itb_all_bankholidays( $date_format );

	$estimates = array();

	foreach( $additions as $key => $value ) {
		$beginning_date = date( 'Y-m-d', strtotime(str_replace('/', '-', $order_date)));
		$estimate_date = date( 'Y-m-d', strtotime(str_replace('/', '-', $order_date) . ' +' . $value . 'weekdays'));
		$estimate_date = $holiday_class->hpy_itb_account_bankholidays($beginning_date, $estimate_date, $holidays, $date_format);

		$estimate_date = $holiday_class->hpy_next_working_day_check(date($date_format, strtotime(str_replace('/', '-', $estimate_date))), $holidays, $date_format);

		$estimates[$key] = date( $date_format, strtotime( $estimate_date ) );
	}
	
	if ( $type == 'order' && !empty($rangesCompare) ) {
		$searchKey = search_exif($rangesCompare, $method_title, $estimates);
		$estimates = $searchKey;
		if ( $searchKey['min'] == $searchKey['max'] ) {
			return array( 'estimate' => $searchKey['min'], 'tag' => 'Delivery On', 'ranges' => $ranges, 'additions' => $additions );
		} else {
			return array( 'estimate' => $searchKey['min'] . ' - ' . $searchKey['max'], 'tag' => 'Delivery Between', 'ranges' => $ranges, 'additions' => $additions );
		}
	}
	
	if ( $type != "shortcode" && $method_title != '' && !empty($productShipping) ) {
		$searchKey = search_exif($productShipping, $method_title, $estimates);
		$estimates = $searchKey;
		if ( $searchKey['min'] == $searchKey['max'] ) {
			return array( 'estimate' => $searchKey['min'], 'tag' => 'Delivery On', 'ranges' => $ranges, 'additions' => $additions );
		} else {
			return array( 'estimate' => $searchKey['min'] . ' - ' . $searchKey['max'], 'tag' => 'Delivery Between', 'ranges' => $ranges, 'additions' => $additions );
		}
	}
	
	if ( $estimates['min'] == $estimates['max'] ) {
		return array( 'estimate' => $estimates['min'], 'tag' => 'Delivery On', 'ranges' => $ranges, 'additions' => $additions );
	} else {
		return array( 'estimate' => $estimates['min'] . ' - ' . $estimates['max'], 'tag' => 'Delivery Between', 'ranges' => $ranges, 'additions' => $additions );
	}
}

function search_exif($exif, $field,$estimates) {
	$dataKey = '';
	foreach ($exif as $Key => $data) {
		if ( $data['title'] == $field ) {
			$dataKey = $Key;
		}
	}
	$dateRange = $exif[$dataKey]['range'];
	if ( $dateRange != '' ) {
		$dateRangeArr = explode( '-', $dateRange );
	}
	if ( $estimates['min'] == $estimates['max'] ) {
		$estimatesStrTime = strtotime($estimates['min']);
	} else {
		$estimatesStrTime = strtotime( $estimates['min'] ) + strtotime( $estimates['max'] ) ;
	}
	if ( isset($dateRangeArr[1]) && $dateRangeArr[1] != '' ) {
		$dateRangeStrTime = strtotime( $dateRangeArr[0] ) + strtotime( $dateRangeArr[1] ) ;
		$dateRangeReturn['min'] = $dateRangeArr[0];
		$dateRangeReturn['max'] = $dateRangeArr[1];
	} else {
		$dateRangeStrTime = strtotime( $dateRangeArr[0] ) ;
		$dateRangeReturn['min'] = $dateRangeArr[0];
	}
	if ( $dateRangeStrTime > $estimatesStrTime ) {
		return $dateRangeReturn;
	} else {
		return $estimates;
	}
}

function dateRangeCompare( $dateRangeArr, $estimates ) {
	if ( $estimates['min'] == $estimates['max'] ) {
		$estimatesStrTime = strtotime($estimates['min']);
	} else {
		$estimatesStrTime = strtotime( $estimates['min'] ) + strtotime( $estimates['max'] ) ;
	}
	if ( isset($dateRangeArr[1]) && $dateRangeArr[1] != '' ) {
		$dateRangeStrTime = strtotime( $dateRangeArr[0] ) + strtotime( $dateRangeArr[1] ) ;
		$dateRangeReturn['min'] = $dateRangeArr[0];
		$dateRangeReturn['max'] = $dateRangeArr[1];
	} else {
		$dateRangeStrTime = strtotime( $dateRangeArr[0] ) ;
		$dateRangeReturn['min'] = $dateRangeArr[0];
	}
	if ( $dateRangeStrTime > $estimatesStrTime ) {
		return $dateRangeReturn;
	} else {
		return $estimates;
	}
}
add_action( 'woocommerce_before_cart_totals', 'cart_item_shipping_method' );

function cart_item_shipping_method() {
	global $woocommerce, $productShipping;
	$countries = WC()->countries->get_countries();
	$cdefaults = array();
	if ( hpy_itb_is_uk_site() ) {
		$currencies = array( 'GB' => 'GBP', 'IE' => 'EUR', 'AU' => 'AUD' );
		$defaults = array( 'GB' => 'GB', 'IE' => 'IE', 'AU' => 'AU' );
		$style = 'style="display:none;"';
	} else {
		$currencies = array( 'US' => 'USD', 'CA' => 'CAD' );
		$defaults = array( 'US' => 'US', 'CA' => 'CA' );
		$style = '';
	}
	if ( hpy_itb_get_current_currency() == 'USD' ) {
		$country = 'US';
		$state = 'AL';
	} else {
		$country = array_search( hpy_itb_get_current_currency(), $currencies );
		$state = '';
	}
	
	$rangesCompare = '';
	foreach( WC()->cart->get_cart() as $cart_item ) {
		
		$_product =  wc_get_product( $cart_item['data']->get_id());
		$p_id = '';
		$p_id = $cart_item['data']->get_id();
		
		$ranges = hpy_itb_get_delivery($country, $state, 'load', $p_id);
		if($rangesCompare != ''){
			$rangesCompare = array_different_check($rangesCompare, $ranges);
		}else{
			$rangesCompare = $ranges;
		}
	}
	$productShipping = $rangesCompare;
}

function array_different_check ( array &$array1, array &$array2 ) {
	if( count($array1) > count($array2) ) {
		$barr = $array1;
		$sarr = $array2;
	} else {
		$sarr = $array1;
		$barr = $array2;
	}
	$merged = array();
	foreach ( $barr as $bkey => $bval ) {
		$sarr;
		if ( array_key_exists ( $bkey, $sarr ) ) {
			$svalue = $sarr[$bkey];
			$bvalue = $bval;
			if( $svalue['estimate'] == $bvalue['estimate'] ){
				$merged[$bkey] = $bvalue ;
			} else if( ( isset($svalue['estimate']) && $svalue['estimate'] != '' ) && ( isset($bvalue['estimate']) && $bvalue['estimate'] != '' ) ) {
				if ( strtotime($svalue['estimate']) > strtotime($bvalue['estimate'] )) {
					$merged[$bkey] = $svalue ;
				} else {
					$merged[$bkey] = $bvalue ;
				}
			}
			
		} else {
			$merged[$bkey] = $bval;	
		}
	}
	return $merged;
}

function hpy_itb_get_highest_range( $ranges ) {

	if ( count( $ranges ) == 1 ) {
		return $ranges[0];
	}

	$arrange = array();

	foreach( $ranges as $key => $value ) {
		$arrange[$key]['min'] = hpy_itb_get_quickest_day($value);
		$arrange[$key]['max'] = hpy_itb_get_longest_day($value);
	}

	uasort( $arrange, 'hpy_itb_production_sort' );
	
	$first = reset($arrange);

	$return = '' . $first['min'] . ' - ' . $first['max'] . ' days';

	return $return;
}

function hpy_itb_production_sort($a,$b) {
	return $b['max'] - $a['max'];
}

function hpy_itb_get_despatched_delivery_range( $method, $order, $despatched, $date_format = 'jS F' ) {
	$hpy_itb_shipping_options = get_option( 'hpy_itb_shipping_lead_settings' );

	$method_id = $method->get_method_id() . ':' . $method->get_instance_id();

	$delivery_range = $hpy_itb_shipping_options[$method_id]['delivery'];

	$ranges['lowest']['delivery'] = $delivery_range ? hpy_itb_get_quickest_day( $delivery_range ) : '';
	$ranges['highest']['delivery'] = $delivery_range ? hpy_itb_get_longest_day( $delivery_range ) : '';

	$min_addition = intval( $ranges['lowest']['production'] ) + intval( $ranges['lowest']['delivery'] );
	$max_addition = intval( $ranges['highest']['production'] ) + intval( $ranges['highest']['delivery'] );

	$additions = array( 'min' => $min_addition, 'max' => $max_addition );

	foreach( $additions as $akey => $avalue ) {
		if ( hpy_itb_is_uk_site() ) {
			date_default_timezone_set('Europe/London');
		} else {
			date_default_timezone_set('America/New_York');
		}
	}

	$holiday_class = new HPY_ITB_Bankholidays();
	$holidays = $holiday_class->hpy_itb_all_bankholidays( $date_format );

	$estimates = array();

	foreach( $additions as $key => $value ) {
		$beginning_date = date($date_format, strtotime(str_replace('/', '-', $despatched)));
		$estimate_date = date($date_format, strtotime(str_replace('/', '-', $despatched) . ' +' . $value . 'weekdays'));

		$estimate_date = $holiday_class->hpy_itb_account_bankholidays($beginning_date, $estimate_date, $holidays, $date_format);

		$estimate_date = $holiday_class->hpy_next_working_day_check(date($date_format, strtotime(str_replace('/', '-', $estimate_date))), $holidays, $date_format);

		$estimates[$key] = $estimate_date;
	}

	if ( $estimates['min'] == $estimates['max'] ) {
		return array( 'estimate' => $estimates['min'], 'tag' => 'Delivery On' );
	} else {
		return array( 'estimate' => $estimates['min'] . ' - ' . $estimates['max'], 'tag' => 'Delivery Between' );
	}
}

/**
 * Output the Expected Dispatch date
 * Takes into account Lead times. Uses the lowest of a range, but the highest option is multiple lead times.
 *
 * @param string $ship_method
 * @param $order
 * @param string $type
 * @param string $date_format
 *
 * @return bool|string
 */
function hpy_itb_get_estimated_dispatch_date( $ship_method = '', $order, $type = 'cart', $date_format = 'd/m/Y' ) {

	if( defined('LOCAL_DEV') && LOCAL_DEV === true ){
		return '';
	}

	if ( $type != 'product' ) {
		$order_date = date( 'd-m-Y', strtotime( $order->order_date ) );
	}

	switch( $type ) {
		case 'cart' :
			$order_items = $order->get_cart();
			$shipping_method = WC()->session->get( 'chosen_shipping_methods' );
			break;

		case 'order' :
			$order_items = $order->get_items( apply_filters( 'woocommerce_purchase_order_item_types', 'line_item' ) );
			$shipping_method = $order->get_items( apply_filters( 'hpy_itb_shipping_zones', 'shipping' ) );
			break;

		case 'product' :
			$order_items = $order;
			$shipping_method = $ship_method;
			break;

		default :
			$order_items = $order->get_cart();
			$shipping_method = WC()->session->get( 'chosen_shipping_methods' );
			break;
	}
	$hpy_itb_shipping_options = get_option( 'hpy_itb_shipping_lead_settings' );
	$estimates = array();
	$shipping_method_id = array();

	if ( isset( $ship_method ) && !empty( $ship_method ) ) {
		$shipping_method_id[] = $ship_method->get_method_id() . ':' . $ship_method->get_instance_id();
	} else {
		foreach ( $shipping_method as $method ) {
			if ( ! is_string( $method ) ) {
				$shipping_method_id[] = $method->get_method_id() . ':' . $method->get_instance_id();
			} else {
				$shipping_method_id[] = $method;
			}
		}
	}

	foreach( $order_items as $item ) {
		if ( !is_array( $item ) ) {
			$id = $item->get_variation_id() ? $item->get_variation_id() : $item->get_product_id();
		} else {
			$id = $item['variation_id'] ? $item['variation_id'] : $item['product_id'];
		}
		$estimates[ 'lead' ][] = hpy_itb_get_quickest_day( get_post_meta( $id, '_hpy_lead_time', true ) );
	}

	$addition = intval( max( $estimates['lead'] ) );

	$beginning_date = date( $date_format, strtotime( $order_date ) );
	$estimate_date = date( $date_format, strtotime( $order_date . ' +' . $addition . ' Weekday' ) );

	$holiday_class = new HPY_ITB_Bankholidays();
	$holidays = $holiday_class->hpy_itb_all_bankholidays( $date_format );

	$estimate_date = $holiday_class->hpy_itb_account_bankholidays( $beginning_date, $estimate_date, $holidays, $date_format );

	$estimate_date = $holiday_class->hpy_next_working_day_check( date( $date_format, strtotime( str_replace ( '/', '-', $estimate_date ) . ' +' . $addition . ' weekdays' ) ), $holidays, $date_format );


	return $estimate_date;

}

function hpy_itb_get_dispatch_range( $product, $ship_method, $urgent = false ) {

	$shipping_class = $product ? $product->get_shipping_class() : '';
	$children = $product ? $product->get_children() : '';
	if ( !empty( $children ) ) {
		foreach( $children as $child ) {
			$lead_time = get_post_meta( $child, '_hpy_lead_time', true );
		}
	} else {
		$p_id = $product ? $product->get_id() : '';
		$lead_time = get_post_meta( $p_id, '_hpy_lead_time', true );
	}


	$hpy_itb_shipping_options = get_option( 'hpy_itb_shipping_lead_settings' );
	$range = '';

	if ( $urgent ) {
		$range = $hpy_itb_shipping_options[$shipping_class]['urgent'];
		if( empty( $range ) ) {
			$range = $lead_time ? $lead_time : $hpy_itb_shipping_options[$shipping_class]['standard'];
			preg_match_all('!\d+!', $range, $matches);
			$ranges = $matches[0];
			foreach( $ranges as $key => $value ) {
				if ( $value > 1 ) {
					$ranges[$key] = (int)$value - 1;
				}
			}
			if ( $ranges[0] == $ranges[1] ) {
				$range = $ranges[0] . ' ' . __( 'day' );
			} else {
				$range = $ranges[0] . ' - ' . $ranges[1]  . ' ' . __( 'days' );
			}
		}
	} else {
		if ( hpy_itb_is_uk_site() ) {
			$range = $hpy_itb_shipping_options[$shipping_class]['standard'] ? $hpy_itb_shipping_options[$shipping_class]['standard'] : $lead_time ;
		} else {
			$range = $lead_time ? $lead_time : $hpy_itb_shipping_options[$shipping_class]['standard'];
		}
	}

	return $range;

}

function hpy_itb_get_lasted_estimated_date( $product, $method_id, $urgent, $production = '', $date_format = 'dS F Y', $order = array() ) {

	if( defined('LOCAL_DEV') && LOCAL_DEV === true ){
		return;
	}

	$hpy_itb_shipping_options = get_option('hpy_itb_shipping_lead_settings');
	if ( $product->is_type( 'variable' ) ) {
		$children = $product->get_children();
		$shipping_classes = array();

		foreach( $children as $child ) {
			$shipping_classes[] = wc_get_product($child)->get_shipping_class();
		}

		$shipping_classes = array_unique( $shipping_classes );

		if ( count( $shipping_classes ) === 1 ) {
			$shipping_class = $shipping_classes[0];
		} else {
			$shipping_class = $shipping_classes[0];
		}

	} else {
		$shipping_class = $product ? $product->get_shipping_class() : '';
	}
	update_option( 'hpy_us_shipping_class', $shipping_class );
	$shipping_method_id = $method_id;
	if (empty($production)) {
		$shipping_class = $product->get_shipping_class();
		if ($urgent) {
			$default = $hpy_itb_shipping_options[$shipping_class]['urgent'] ? $hpy_itb_shipping_options[$shipping_class]['urgent'] : $hpy_itb_shipping_options[$shipping_class]['standard'];
		} else {
			$default = $hpy_itb_shipping_options[$shipping_class]['standard'];
		}

		$id = $product->get_id();
		$end_leadtime = hpy_itb_get_longest_day(get_post_meta($id, '_hpy_lead_time', true) ? get_post_meta($id, '_hpy_lead_time', true) : $default);
		update_option( 'hpy_us_end_leadtime_no_prod', $end_leadtime );
		$estimates['lead_end'] = hpy_itb_get_longest_day($end_leadtime);
	} else {
		$id = $product->get_id();
		if (hpy_itb_is_uk_site()) {
			$end_leadtime = $hpy_itb_shipping_options[$shipping_class]['standard'] ? $hpy_itb_shipping_options[$shipping_class]['standard'] : get_post_meta($id, '_hpy_lead_time', true);
		} else {
			if ( !empty( $shipping_class ) ) {
				$end_leadtime = $hpy_itb_shipping_options[$shipping_class]['standard'];
			} else {
				$end_leadtime = get_post_meta($id, '_hpy_lead_time', true) ? get_post_meta($id, '_hpy_lead_time', true) : $hpy_itb_shipping_options[$shipping_class]['standard'];
			}
		}

		update_option( 'hpy_us_end_leadtime_prod', $end_leadtime );

		if ($end_leadtime == 'Array') {
			$end_leadtime = '';
		}
		$estimates['lead_end'] = hpy_itb_get_longest_day($end_leadtime ? $end_leadtime : $production);
	}


	if ( $urgent ) {
		if ( empty( $hpy_itb_shipping_options[$shipping_class]['urgent'] ) && empty( $production ) ) {
			if ($estimates['lead_end'] > 1) {
				$estimates['lead_end'] = $estimates['lead_end'] - 1;
			}
		} else {
			if ($estimates['lead_end'] > 1) {
				$estimates['lead_end'] = $estimates['lead_end'] - 1;
			}
		}
	}

	if ( hpy_itb_is_uk_site() ) {
		if (date('H') < 12) {
			$estimates['lead_end']--;
		}
	}

	$estimates[ 'delivery' ] = hpy_itb_get_longest_day( $hpy_itb_shipping_options[$shipping_method_id] );

	$addition = (int)$estimates['lead_end'] + (int)$estimates[ 'delivery' ];
	$estimate_date = date( $date_format, strtotime( 'NOW +' . $addition . ' weekdays' ) );

	if ( in_array( $estimate_date, array( 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday' ) ) ) {
		if ( $estimate_date == 'Saturday' ) {
			$estimate_date = date( $date_format, strtotime( $estimate_date . '+ 2 days' ) );
		} else if ( $estimate_date == 'Sunday' ) {
			$estimate_date = date( $date_format, strtotime( $estimate_date . '+ 1 day' ) );
		}
		return $estimate_date;
	}

	$holiday_class = new HPY_ITB_Bankholidays();
	$holidays = $holiday_class->hpy_itb_all_bankholidays( $date_format );

	$beginning_date = date( $date_format, strtotime( 'NOW' ) );

	$estimate_date = $holiday_class->hpy_itb_account_bankholidays( $beginning_date, $estimate_date, $holidays, $date_format );

	$estimate_date = $holiday_class->hpy_next_working_day_check( date( $date_format, strtotime( str_replace ( '/', '-', $estimate_date ) ) ), $holidays, $date_format );

	return $estimate_date;
}

function hpy_itb_get_shipping_percentage( $order_date, $dispatch_by_date, $estimated_date ) {

	$estimated_date = end( explode( ' - ', $estimated_date ) );

	$start = strtotime( $order_date );
	$end = strtotime( $estimated_date );

	if (  strtotime( 'NOW' ) == strtotime( $dispatch_by_date ) ) {
		$percentage = '50';
	} else if ( strtotime( 'NOW' ) >= $end ) {
		$percentage = '100';
	}

	if ( empty( $percentage ) ) {

		$current = strtotime( 'NOW' );

		// var_dump( $estimated_date, date( 'dS F Y', strtotime( 'NOW' ) ));
		// var_dump( ($current - $start) );
		// var_dump( ($end - $start) );
		// var_dump( ($current - $start) / ($end - $start) );

		$percentage = (($current - $start) / ($end - $start)) * 100;
	}

	return $percentage;
}

/**
 * Depending on whether it's a guest or user get the correct My Account Button
 *
 * @param $order
 *
 * @return string
 */
function hpy_itb_get_thank_you_button( $order ) {

	global $woocommerce;

	$wc_session  = $woocommerce->session;
	$guest_email = $wc_session->get( 'hpy_guest_email' );
	$button      = '';
	$orders      = $wc_session->get( 'hpy_guest_orders' ) ? $wc_session->get( 'hpy_guest_orders' ) : array();

	if ( is_user_logged_in() ) {
		$button = itb_button( 'a', 'View my account', array(
			'href' => hpy_get_order_tracking_link( $order ),
			'class' => 'green-button',
		) );
	} else if ( isset( $guest_email ) && ! empty( $guest_email ) ) {
		if ( ! in_array( $order->get_id(), $orders ) ) {
			array_push( $orders, $order->get_id() );
			$wc_session->set( 'hpy_guest_orders', $orders );
		}
		$button = itb_button( 'a', 'Create my account', array(
			'href' => hpy_get_order_tracking_link( $order ),
			'class' => 'green-button',
		) );
	}

	$wc_session->save_data();

	return $button;
}

function hpy_get_order_tracking_link( $order ){
	return esc_url( wc_get_account_endpoint_url( 'orders' ) );
}

//Remove the Default Cross Sells from the Cart.
remove_action( 'woocommerce_cart_collaterals', 'woocommerce_cross_sell_display');
function hpy_itb_get_checkout_recommended_products( $order, $limit = 6 ) {

	global $woocommerce;

	$order_items = $order->get_items( apply_filters( 'woocommerce_purchase_order_item_types', 'line_item' ) );
	$recommended_ids = array();
	$purchased_ids = array();
	$output_ids = array();

	foreach( $order_items as $item ) {
		$id = $item->get_variation_id() ? $item->get_variation_id() : $item->get_product_id();
		$product = wc_get_product( $id );

		$purchased_ids[] = $product->get_parent_id() ? $product->get_parent_id() : $product->get_id();
		$recommended_ids = array_unique( array_merge( $recommended_ids, $product->get_cross_sell_ids() ), SORT_REGULAR );

	}

	if ( empty( $recommended_ids ) || count( $recommended_ids ) < $limit ) {
		// Get visible related products then sort them at random.
		$related_products = array_filter( array_map( 'wc_get_product', wc_get_related_products( ($product->get_parent_id() ? $product->get_parent_id() : $product->get_id()), $limit, $purchased_ids ) ), 'wc_products_array_filter_visible' );

		foreach( $related_products as $r_prod ) {
			$recommended_ids[] = $r_prod->get_id();
		}
	}

	if ( isset( $purchased_ids ) && !empty( $purchased_ids ) ) {
		$output_ids = array_diff( $recommended_ids, $purchased_ids );
		shuffle( $output_ids );
		$output_ids = array_slice( $output_ids, 0, $limit );
	}

	return $output_ids;

}

function hpy_output_recommended_products( $order, $col_class = '' ){

	$ids = hpy_itb_get_checkout_recommended_products( $order );
	if ( isset( $ids ) && !empty( $ids ) ) { ?>
		<div class="related thank-you-related <?php echo $col_class; ?>">
			<h3><?php _e( 'You May Also Like' ); ?></h3>
			<ul class="products columns-3"><?php
				foreach( $ids as $id ) {

					$product = wc_get_product( $id );

					?><li class="post-<?php echo $id; ?> product">
						<div class="archive_product_wrap">
							<a href="<?php echo $product->get_permalink(); ?>">
								<?php echo $product->get_image( 'woocommerce_thumbnail' ); ?>
								<div class="product_details">
									<?php HPY_ITB_Trustpilot_API::output_archive_product_rating( $product ); ?>
									<h2 class="woocommerce-loop-product__title"><?php echo $product->get_title(); ?></h2>
									<span class="price">
										<?php echo wc_price( $product->get_price() ); ?>
									</span>
								</div>
							</a>
						</div>
					</li><?php
				}
			?></ul>
		</div><?php
	}
}


function hpy_itb_get_quickest_day( $string ) {
	preg_match_all('!\d+!', $string, $matches);
	return ! empty( $matches[0] ) ? min( $matches[0] ) : '' ;
}

function hpy_itb_get_longest_day( $string ) {
	preg_match_all( '!\d+!', $string, $matches );
	return ! empty( $matches[0] ) ? max( $matches[0] ) : '' ;
}

/**
 * Cart functions
 */
add_action( 'itb_cart_header', 'itb_output_cart_header', 5 );
function itb_output_cart_header(){
	if( current_user_can('manage_options') ){
		echo '<a id="hpy_remove_all_from_cart" href="' . wc_get_cart_url() . '?empty-cart" style="display:inline-flex;align-items:center;text-decoration:none;background:#ee2d3d;color:#FFF;margin-bottom:1em;">' . get_hpy_svg('cross-icon', '', array( 'style' => 'fill:#FFF;height:1em;width:1em;margin-right:0.6em;' )) . 'Remove All</a>';
	}
	?>
	<header class="cart-header">
		<h1><?php _e('My Basket', 'hpy') ?></h1>
		<span class="cart-header-total"><?php
			$total = WC()->cart->get_cart_contents_count();
			printf( _n( '%s Item', '%s Items', $total, 'hpy' ), number_format_i18n( $total ) ); ?>
		</span>
	</header><?php
}

add_action( 'woocommerce_after_cart', 'hpy_cart_navigation', 5 );
function hpy_cart_navigation(){

	if ( hpy_is_label( WC()->cart->get_cart_contents(), 'cart' ) ) {
		$shopping_link = home_url('/label-redemption');
		$shopping_text = __('Redeem Another Label', 'hpy');
	} else {
		$shopping_link = home_url('/');
		$shopping_text = __('Continue shopping', 'hpy');
	}

	$delivery_post = get_field( 'basket_delivery_link', 'options' );
	$delivery_link = !empty( $delivery_post ) ? get_permalink( $delivery_post->ID ) : home_url('/') ;
	?>
	<div class="itb_cart_navigations">
		<a href="<?php echo $shopping_link; ?>"><?php
			hpy_svg('special-arrow-left');
			echo $shopping_text
		?></a>
		<a href="<?php echo $delivery_link; ?>" target="_blank"><?php
			hpy_svg('delivery');
			_e('Delivery info', 'hpy');
		?></a>
	</div>

	<?php
}

add_filter('woocommerce_cart_item_name', 'hpy_cart_get_product_title', 5, 3 );
function hpy_cart_get_product_title( $name, $cart_item, $cart_item_key ){
	return $cart_item['data']->get_title();
}

function hpy_cart_item_has_giftbox( $product_id, $cart_item, $cart_item_key ){

	$upsell_added = false;

	$id = ! empty( $cart_item['variation_id'] ) ? $cart_item['variation_id'] : $product_id;
	$product_type = wc_get_product( $id )->get_type();

	$post_meta = get_post_meta( $product_id, '_hpy_personalisation');
	$upsell = (object) array(
		'has' => false,
		'id' => '',
		'field' => '',
		'override_price' => ''
	);

	$cart_pers = $cart_item['hpy_personalisation_data'];
	
	if ( ! empty( $cart_pers['upsell'] ) ) {
		$upsell_added = true;
		return;
	}

	$data = 'string' === gettype( $post_meta[ 0 ] ) ? json_decode( $post_meta[ 0 ], true ) : $post_meta[0];

	if ( !empty( $data['personalisations'] ) ) {
		if (!$upsell_added) {

			foreach ($data['personalisations'] as $key => $pers) {
				if (!empty($pers['type']) && $pers['type'] == 'upsells') {

					if ($product_type !== 'simple') {
						// use conditional logic to determine if the giftbox should be allowed to be added depending on the variation
						if ($pers['clogic']) {
							$or_arr = array();
							foreach ($pers['clogic'] as $or) {
								foreach ($or as $and) {
									$and_arr = array();
									if ($and['type'] == 'variations') {
										if ($and['middle'] == 'true') {
											$and_arr[] = $id == intval($and['first']) ? true : false;
										} else {
											$and_arr[] = $id != intval($and['first']) ? true : false;
										}
									}
								}
								$or_arr[] = !empty($and_arr) && !in_array(false, $and_arr) ? true : false;
							}

							// if neither of the upsell's conditional logic or conditions are true then this upsell is not active for the variation
							if (!in_array(true, $or_arr)) {
								continue;
							}
						}
					}

					$upsell->has = true;
					$upsell->id = $pers['upsells'][0]['id'];
					$upsell->field = $key;
					$upsell->override_price = $pers['price_override'][$upsell->id];
				}
			}

			if ($upsell->has) {
				$upsell_prod = wc_get_product($upsell->id);
				$price = $upsell->override_price ? $upsell->override_price : $upsell_prod->get_price(); ?>
				<div class="cart_item_addition giftbox_addition">
					<input type="checkbox" name="cart-item-giftbox[<?php echo $cart_item_key; ?>]"
					       id="cart-item-giftbox-<?php echo $cart_item_key; ?>" data-id="<?php echo $upsell->id ?>"
					       data-field="<?php echo $upsell->field ?>"
					       data-override="<?php echo $upsell->override_price ?>"<?php
					if (!empty($cart_item['hpy_personalisation_data']['upsell'])) {
						echo ' checked="checked"';
					}
					?>>
					<label for="cart-item-giftbox-<?php echo $cart_item_key; ?>">
						<div class="finishing_check">
							<?php hpy_svg('tick-icon'); ?>
						</div>
						<p><?php _e('Add a Giftbox', 'hpy'); ?></p>
						<span class="additional_price">+<?php
							if ( hpy_itb_get_current_currency() == 'AUD' ) {
								echo wc_price( round( $price ) );
							} else {
								echo wc_price($price);
							}
							?></span>
					</label>
				</div>
				<?php
			}
		}
	}
}

function hpy_cart_item_has_hardback( $product_id, $cart_item, $cart_item_key ) {

	if ( hpy_is_label( $cart_item ) ) {
		return;
	}

	$id = $cart_item[ 'variation_id' ] ? $cart_item[ 'variation_id' ] : $cart_item[ 'product_id' ];
	if ( $cart_item['variation_id'] == 0 ) {
		unset( $cart_item['variation_id'] );
	}
	$type          = $cart_item[ 'variation_id' ] ? 'variable' : 'simple';
	$hardback_name = '';
	$hardback_id   = '';
	$softback_name = '';
	$softback_id   = '';
	$has_hardback  = false;
	$is_hardback   = false;
	$attribute_array = array();

	if ( $type == 'variable' ) {
		$product = wc_get_product($id);
		
		$attributes = get_post_meta( $product->get_id(), '_product_attributes', true );
		if ( !empty( $attributes ) ) {
			$attribute_array[] = (object) array(
				'slug' => $attributes['pa_cover']['value']
			);
		}
		$variable_terms = get_the_terms($product->get_id(), 'pa_cover') ? get_the_terms($product->get_id(), 'pa_cover') : $attribute_array;
		$parent_terms = get_the_terms($product->get_parent_id(), 'pa_cover');

		if (!empty($parent_terms)) {
			foreach ($parent_terms as $parent_term) {
				$term_parts = explode('-', $parent_term->slug);
				if (in_array('hardback', $term_parts)) {
					$hardback_name = $parent_term->name;
					$has_hardback = true;
				}
				if (in_array('softback', $term_parts)) {
					$softback_name = $parent_term->name;
				}
			}
		}

		if (!empty($variable_terms)) {
			foreach ($variable_terms as $variable_term) {
				$term_parts = explode('-', $variable_term->slug);
				if (in_array('hardback', $term_parts)) {
					$is_hardback = true;
				}
			}
		} elseif (!empty($cart_item['variation'])) {
			if ($cart_item['variation']['attribute_pa_cover'] == 'hardback') {
				$is_hardback = true;
			}
		}

		if (!$is_hardback) {
			foreach (wc_get_product($product->get_parent_id())->get_children() as $child) {
				$variant = wc_get_product($child);
				if ($variant->get_attribute('pa_cover') == $hardback_name) {
					$hardback_id = $variant->get_id();
				}
			}
		} else {
			foreach (wc_get_product($product->get_parent_id())->get_children() as $child) {
				$variant = wc_get_product($child);
				if ($variant->get_attribute('pa_cover') == $softback_name) {
					$softback_id = $variant->get_id();
				}
			}
		}

		if (!$is_hardback && $has_hardback) {
			$soft_prod = wc_get_product($softback_id ? $softback_id : $product->get_id());
			$hard_prod = wc_get_product($hardback_id ? $hardback_id : $product->get_id());
			$price_diff = (float) $hard_prod->get_price() - (float) $soft_prod->get_price();
			if ( $price_diff <= 0 ) {
				return;
			}
			?>
			<div class="cart_item_addition hardback_addition">
				<input type="checkbox" name="cart-item-hardback[<?php echo $cart_item_key; ?>]"
				       id="cart-item-hardback-<?php echo $cart_item_key; ?>"
				       data-soft_id="<?php echo $softback_id; ?>"
				       data-hard_id="<?php echo $hardback_id; ?>"
				       data-parent_id="<?php echo $product->get_parent_id(); ?>"
				       data-is_hard="<?php echo $is_hardback ? 'true' : 'false'; ?>"
					   data-variant-name="<?php echo 'Cover'; ?>"
					   data-variant-title="<?php echo __('Hardback', 'hpy');  ?>"
					<?php echo $is_hardback ? 'checked="checked"' : ''; ?>
					   data-type="<?php echo $type; ?>">
				<label for="cart-item-hardback-<?php echo $cart_item_key; ?>">
					<div class="finishing_check">
						<?php hpy_svg('tick-icon'); ?>
					</div>
					<p><?php _e('Upgrade to Hardback', 'hpy'); ?></p>
					<span class="additional_price">+<?php echo wc_price($price_diff); ?></span>
				</label>
			</div>
			<?php
		}
	}
}

add_action('woocommerce_cart_collaterals', 'itb_cart_total_header', 5);
function itb_cart_total_header(){ ?>
	<div class="shipping_title_v3">
		<h2><?php _e( 'Summary', 'hpy' ); ?></h2>
		<h3><?php _e( 'Delivery', 'hpy') ?></h3>
	</div>
	
	<?php if ( is_cart() ) : ?>
		<?php woocommerce_shipping_calculator(); ?>
	<?php endif;
}

add_action('woocommerce_after_cart_totals', 'itb_cart_secure_payment_image', 10 );
function itb_cart_secure_payment_image(){
	$img = THEME_IMAGES . 'secure-checkout';
	echo '<img class="secure-checkout-img" src="' . $img . '.jpg" srcset="' . $img . '.jpg 1x, ' . $img . '@2x.jpg 2x, ' . $img . '@3x.jpg 3x" alt="' . __('Secure Payment', 'hpy') . '"/>';
}

/**
 * Checkout functions
 */
remove_action( 'woocommerce_before_checkout_form', 'woocommerce_checkout_coupon_form', 10 );
remove_action( 'woocommerce_checkout_order_review', 'woocommerce_checkout_payment', 20 );
add_action( 'itb_checkout_payment', 'woocommerce_checkout_payment', 10 );

add_action('woocommerce_before_checkout_form', 'open_checkout_wrap', 10 );
add_action('woocommerce_after_checkout_form', 'close_checkout_wrap', 10 );
function open_checkout_wrap(){
	if( ! empty( $_GET['errorcode'] ) ){
		$msg = get_checkout_errorcode_message( $_GET['errorcode'] );
		if( ! empty( $msg ) ){
			echo '<div class="hpy-error checkout-error"><div class="container"><ul><li>' . $msg . '</li></ul></div></div>';
		}
	}
	echo '<div class="container checkout-wrap">';
		echo '<div class="row">';
}

function get_checkout_errorcode_message( $code ){
	$messages = array(
		'1' => sprintf( __( '<strong>Transaction Failed</strong> - 3D Secure authentication failure. You have not been charged. Please try again, or contact us on %s.', 'hpy' ), get_theme_mod('site_phone') ),
		'2' => sprintf( __( '<strong>Transaction Failed</strong> - 3D Secure authentication could not be completed. You have not been charged. Please try again, or contact us on %s.', 'hpy' ), get_theme_mod('site_phone') ),
		'3' => sprintf( __( '<strong>Transaction Failed</strong> - 3D Secure was unable to authenticate. You have not been charged. Please try again, or contact us on %s.', 'hpy' ), get_theme_mod('site_phone') ),
		'4' => sprintf( __( '<strong>Transaction Failed</strong> - Issue with your card. You have not been charged. Please try again, or contact us on %s.', 'hpy' ), get_theme_mod('site_phone') ),
	);

	return isset( $messages[ $code ] ) ? $messages[ $code ] : false ;
}

function close_checkout_wrap(){
	echo '</div></div>';
}

add_filter( 'woocommerce_checkout_fields' , 'hpy_override_checkout_fields' );
function hpy_override_checkout_fields( $fields ) {
	// remove the phone number from the billing fields so it is not duplicated
	unset( $fields['billing']['billing_phone'] );

	// remove the update_totals_on_change class from the billing country, this prevents the shipping updating when the country is changed
	if ( ( $key = array_search('update_totals_on_change', $fields['billing']['billing_country']['class'] ) ) !== false) {
		unset($fields['billing']['billing_country']['class'][$key]);
	}

	$fields['shipping']['shipping_postcode']['class'][] = 'lr_run_bl_check';
	unset( $fields['billing']['billing_email']['class'][1] );


	return $fields;
}

add_filter( 'woocommerce_default_address_fields', 'hpy_override_default_address_fields');
function hpy_override_default_address_fields( $fields ){
	// remove the company from both shipping and billings fields
	unset( $fields['company'] );

	// addinf the phoneumber field to both shipping and billing
	$fields['phone_number'] = array(
		'label' => __( 'Mobile Number', 'hpy' ),
		'required' => true,
		'type' => 'tel',
		'class' => array(
			0 => 'form-row-wide',
		),
		'validate' => array(
			0 => 'phone',
		),
		'autocomplete' => 'tel',
		'priority' => 30,
	);

	$fields['email'] = array(
		'label' => __( 'Email address', 'hpy' ),
		'required' => true,
		'type' => 'email',
		'class' => array(
			0 => 'form-row-wide',
			1 => 'lr_run_bl_check'
		),
		'validate' => array(
			0 => 'email',
		),
		'autocomplete' => 'email username',
		'priority' => 110,
	);


	$fields['country']['class'][] = 'select-wrap has-label';
	// $fields['state']['class'][] = 'select-wrap';

	return $fields;
}

function get_shipping_methods_output( $available_methods, $index, $chosen_method, $is_single = false ){
	global $woocommerce, $wp_query;
	$class = is_cart() ? 'radio-button-group' : 'checkout-radio-button-group' ;
	if( $is_single ): ?>
		<div class="<?php echo $class; ?> is-checked"><?php

			$method = current( $available_methods );
			$price_html = get_method_price( $method );
			ob_start();

			?><label for=""><div class="radio-group-check"></div>
			<div class="radio-group-details">
				<div class="shipping_method_top">
					<div class="shipping_method_label"><?php
						if( is_cart() ) {
							// echo $price_html;
						}
						echo $method->get_label( $method );
					?></div>
					<div class="shipping_methods_details">
						<?php echo $price_html; ?>
						<?php $return = hpy_itb_get_delivery_range( $method, $woocommerce->cart, '', 'jS M' ); ?>
						<span class="shipping_estimate"><?php echo $return['tag']; ?> <strong><?php echo $return['estimate']; ?></strong></span>
					</div>
				</div>

			</div></label><?php

			printf( '<input type="hidden" name="shipping_method[%1$d]" data-index="%1$d" id="shipping_method_%1$d" value="%2$s" class="shipping_method" />%3$s', $index, esc_attr( $method->id ), ob_get_clean() );
			do_action( 'woocommerce_after_shipping_rate', $method, $index );
			?>
		</div><?php
	else :

		foreach ( $available_methods as $method ) :
			$price_html = get_method_price( $method );
		?>
			<div class="<?php echo $class; ?>">
				<?php ob_start(); ?>
				<div class="radio-group-check"></div>
				<div class="radio-group-details">
					<div class="shipping_method_top">
						<span class="shipping_method_label"><?php
							if( is_cart() ) {
								//echo $price_html;
							}
							echo '<span class="shipping_method_name">' . $method->get_label() . '</span>';
							echo $price_html;
						?></span>
						<div class="shipping_methods_details">
							<?php //if( ! $is_cart  ) {
								//echo $price_html;
							//} ?>
<!--							<span class="shipping_estimate">Latest delivery date <strong>--><?php //echo hpy_itb_get_estimated_delivery_date( $method, $woocommerce->cart ); ?><!--</strong></span>-->
							<?php $return = hpy_itb_get_delivery_range( $method, $woocommerce->cart, '', 'jS M' ); ?>
							<span class="shipping_estimate"><?php echo $return['tag']; ?> <strong><?php echo $return['estimate']; ?></strong></span>
						</div>
					</div>
				</div><?php

				$markup = ob_get_clean();

				printf( '<input type="radio" name="shipping_method[%1$d]" data-index="%1$d" id="shipping_method_%1$d_%2$s" value="%3$s" class="shipping_method" %4$s />
						<label for="shipping_method_%1$d_%2$s">%5$s</label>',
					$index, sanitize_title( $method->id ), esc_attr( $method->id ), checked( $method->id, $chosen_method, false ), $markup );

				do_action( 'woocommerce_after_shipping_rate', $method, $index );
				?>
			</div>
		<?php endforeach;

	endif;

}

function get_method_price( $method ){
	$price = 'Free';

	if ( $method->cost > 0 ) {
		if ( WC()->cart->display_prices_including_tax() ) {
			$price = wc_price( $method->cost + $method->get_shipping_tax() );
			if ( $method->get_shipping_tax() > 0 && ! wc_prices_include_tax() ) {
				$price .= ' <small class="tax_label">' . WC()->countries->inc_tax_or_vat() . '</small>';
			}
		} else {
			$price = wc_price( $method->cost );
			if ( $method->get_shipping_tax() > 0 && wc_prices_include_tax() ) {
				$price .= ' <small class="tax_label">' . WC()->countries->ex_tax_or_vat() . '</small>';
			}
		}
	}

	return '<span class="price">' . $price . '</span>';
}

add_action('woocommerce_before_checkout_billing_form', 'hpy_add_shipping_address_checkbox', 10 );
function hpy_add_shipping_address_checkbox( $checkout ){
	?>
	<span class="wc-checkout-same-as-shipping"><?php _e('Same as delivery address', 'hpy'); ?></span>
	<label id="ship-to-different-address" class="woocommerce-form__label woocommerce-form__label-for-checkbox checkbox" style="display:none;">
		<input id="ship-to-different-address-checkbox" class="woocommerce-form__input woocommerce-form__input-checkbox input-checkbox" <?php checked( apply_filters( 'woocommerce_ship_to_different_address_checked', 'shipping' === get_option( 'woocommerce_ship_to_destination' ) ? 1 : 0 ), 1 ); ?> type="checkbox" name="ship_to_different_address" value="1" checked="checked"/>
	</label><?php
	itb_button('a', __( 'Use different billing address', 'hpy' ), array(
		'href' => '#',
		'class' => 'lightblue-button toggle_address',
		'id' => 'hpy_bill_to_different_address',
		'data-checked' => 'false',
		'data-unchecked-text' => __( 'Use different billing address', 'hpy' ),
		'data-checked-text' => __('Use same billing address', 'hpy')
	));
}

add_filter('woocommerce_order_button_html', 'hpy_order_button_html' );
function hpy_order_button_html(){
	$order_button_text = apply_filters('woocommerce_order_button_text', __('Place Order', 'woocommerce'));
	$button = itb_button('button', $order_button_text, array(
		'type' => 'submit',
		'class' => 'button alt green-button',
		'name' => 'woocommerce_checkout_place_order',
		'id' => 'place_order',
		// 'data-value' => $order_button_text // causes svg not t be output for some reason
	), false );

	return $button;
}

add_action( 'woocommerce_review_order_before_submit', 'hpy_add_newsletter_signup', 10 );
function hpy_add_newsletter_signup(){ ?>
	<div class="hpy_newsletter_signup_wrap">
		<input type="checkbox" name="hpy_newsletter_signup" id="hpy_newsletter_signup" checked="checked">
		<label for="hpy_newsletter_signup">
			<span class="finishing_check"><?php hpy_svg('tick-icon'); ?></span>
			<?php if ( hpy_itb_is_uk_site() ) { ?>
				<p><?php _e('Sign up for exclusive special offers, the latest personalised gifts and more. If you do not want to receive marketing emails, please uncheck the box.', 'hpy') ?></p>
			<?php } else { ?>
				<p><?php _e('Sign up for exclusive special offers, the latest personalized books and more. If you do not want to receive marketing emails, please uncheck the box', 'hpy'); ?></p>
			<?php } ?>
		</label>
	</div><?php
}

add_action('woocommerce_checkout_update_order_meta', 'hpy_add_user_to_newsletter', 10 );
function hpy_add_user_to_newsletter(){

	if( ! class_exists( 'HPY_Newsletter_Signup') )
		return;

	if ( $_POST['hpy_newsletter_signup'] !== 'on' ) {
		return;
	}

	if( ! empty( $_POST['shipping_email'] ) && ! empty( $_POST['shipping_first_name'] ) && ! empty( $_POST['shipping_last_name'] ) ) :
		$newsletter = new HPY_Newsletter_Signup();
		$newsletter->add_to_list( $_POST['shipping_email'], $_POST['shipping_first_name'] . ' ' . $_POST['shipping_last_name'] );
	endif;
}

add_action( 'woocommerce_review_order_after_submit', 'hpy_checkout_order_notice', 10 );
function hpy_checkout_order_notice(){
	$notice = get_field('checkout_notice', 'options');
	if( ! empty( $notice ) ){
		echo '<p class="hpy_checkout_order_notice">' . $notice . '</p>';
	}
}

add_action('woocommerce_checkout_after_order_review', 'hpy_order_review');
function hpy_order_review(){ ?>
	<div class="hpy_order_details">
		<h4><?php _e('Order details', 'hpy'); ?></h4>
		<div id="hpy-order-details-wrap"></div>
	</div><?php
}

add_action('woocommerce_review_order_before_order_total', 'hpy_checkout_delivery_row');
function hpy_checkout_delivery_row(){
	$packages = WC()->shipping->get_packages();
	
	foreach ( $packages as $i => $package ) {
		$chosen_method = isset( WC()->session->chosen_shipping_methods[ $i ] ) ? $package['rates'][ WC()->session->chosen_shipping_methods[ $i ] ] : '';
		if( ! empty( $chosen_method ) && $chosen_method->get_cost() >0 ){ ?>
			<div class="flex-table-row shipping-total">
				<div class="flex-table-head"><?php _e( 'Delivery', 'woocommerce' ); ?></div>
				<div class="flex-table-cell"><?php echo get_woocommerce_currency_symbol() . $chosen_method->get_cost(); ?></div>
			</div><?php
			break;
		}
	}
}

add_filter('woocommerce_cart_totals_coupon_html', 'hpy_cart_coupon_html', 10, 3 );
function hpy_cart_coupon_html( $html, $coupon, $discount_html ){
	$url = esc_url( add_query_arg( 'remove_coupon', urlencode( $coupon->get_code() ), defined( 'WOOCOMMERCE_CHECKOUT' ) ? wc_get_checkout_url() : wc_get_cart_url() ) );
	$html = $discount_html;
	return $html;
}

//add_filter('woocommerce_cart_totals_order_total_html', 'hpy_cart_order_total_html' );
//As we are displaying the Discount separately now this probably isn't needed anymore.
function hpy_cart_order_total_html( $value ){

	if( is_checkout() ){
		return $value;
	}

	$totals = WC()->cart->get_totals();
	$before_discounts = '';
	if( count( WC()->cart->get_coupons() ) > 0 ){
		$before_discounts = '<del>' . ( floatval( $totals['total'] ) + floatval( $totals['discount_total'] ) ) . '</del>';
	}
	return $value . $before_discounts;
}

add_filter('hpy_related_products_title', 'hpy_related_products_title');
function hpy_related_products_title( $title ){
	if( is_product() ){
		return esc_html__('You May Also Like', 'hpy');
	}
	return $title;
}

add_action( 'pre_get_posts', 'hpy_itb_products_pre_get_posts' );
function hpy_itb_products_pre_get_posts( $query ) {

	if ( ! is_admin() && $query->is_main_query() ) {
		$tax_query = array(
			'taxonomy' => 'product_type',
			'field'    => 'slug',
			'terms'    => array( 'upsells', 'labels' ),
			'operator' => 'NOT IN'
		);
		$query->tax_query->queries[] = $tax_query;
		$query->query_vars['tax_query'][] = $query->tax_query->queries;
	}
}

function woocommerce_related_products( $args = array() ) {
	global $product;

	if ( ! $product ) {
		return;
	}

	$defaults = array(
		'posts_per_page' => 2,
		'columns'        => 2,
		'orderby'        => 'rand', // @codingStandardsIgnoreLine.
		'order'          => 'desc',
	);

	$args = wp_parse_args( $args, $defaults );

	$excluded_ids = hpy_itb_get_excluded_ids();

	if ( is_array( $excluded_ids ) && !is_array( $product->get_upsell_ids() ) ) {
		$excluded_ids[] = $product->get_upsell_ids();
	} else if ( is_array( $excluded_ids ) && is_array( $product->get_upsell_ids() ) ) {
		$excluded_ids = array_merge( $excluded_ids, $product->get_upsell_ids() );
	} else {
		$excluded_ids = $product->get_upsell_ids();
	}


	// Get visible related products then sort them at random.
	$args['related_products'] = array_filter( array_map( 'wc_get_product', wc_get_related_products( $product->get_id(), $args['posts_per_page'], $excluded_ids ) ), 'wc_products_array_filter_visible' );

	// Handle orderby.
	$args['related_products'] = wc_products_array_orderby( $args['related_products'], $args['orderby'], $args['order'] );

	// Set global loop values.
	wc_set_loop_prop( 'name', 'related' );
	wc_set_loop_prop( 'columns', apply_filters( 'woocommerce_related_products_columns', $args['columns'] ) );

	wc_get_template( 'single-product/related.php', $args );
}

function hpy_itb_get_excluded_ids(){

	$excluded_ids = array();

	$args = array(
		'posts_per_page' => -1,
		'post_type' => 'product',
		'tax_query' => array(
			array(
				'taxonomy' => 'product_type',
				'field'    => 'slug',
				'terms'    => 'upsells'
			),
		),
	);

	$upsells = new WP_Query( $args );

	if( $upsells->have_posts() ) {
		while( $upsells->have_posts() ) : $upsells->the_post();
			$excluded_ids[] = get_the_ID();
		endwhile;
	}

	return $excluded_ids;

}

add_action( 'woocommerce_product_query', 'hpy_itb_pre_get_products_query', 20 );
function hpy_itb_pre_get_products_query( $query ) {
	$per_page = filter_input(INPUT_GET, 'perpage', FILTER_SANITIZE_NUMBER_INT);
    if( $query->is_main_query() && !is_admin() && ( is_post_type_archive( 'product' ) || is_product_category() ) ) {
        $query->set( 'posts_per_page', !empty( $per_page ) ? $per_page : 32 );
    }
    
    /**
     * Prepend featured products.
     */
    if ( is_product_category() && ! is_admin() ) {

		$term = get_queried_object();
		
		$featured_product_ids = get_field( 'featured_products', $term );
		
		if(!$featured_product_ids) {
		    return;
        }

		$sort_data = get_field( 'sort_data', $term );
		if ( ! $sort_data ) {
			$sort_data = 'menu_order';
		}


		$products             = new WP_Query( array(
			'post_type'      => 'product',
			'post_status'    => 'publish',
			'fields'         => 'ids',
			'posts_per_page' => - 1,
			'orderby'        => $sort_data,
			'order'          => 'ASC',
			'tax_query'      => array(
				'relation' => 'AND',
				array(
					'taxonomy' => 'product_cat',
					'field'    => 'term_id',
					'terms'    => $term->term_id,
					'operator' => 'IN',
				),
			)
		) );
		$current_product_ids  = $products->posts;
		$product_ids = 	array_unique( array_merge( $featured_product_ids, $current_product_ids ), SORT_REGULAR );
		if ( $product_ids ) {
			$query->set( 'post__in', $product_ids );
			$query->set( 'orderby', 'post__in' );
		}	
	}
}

function hpy_get_user_meta( $user_id, $key ) {
	$value           = get_user_meta( $user_id, $key, true );
	$existing_fields = array( 'shipping_first_name', 'shipping_last_name' );
	if ( ! $value && in_array( $key, $existing_fields ) ) {
		$value = get_user_meta( $user_id, str_replace( 'shipping_', '', $key ), true );
	} elseif ( ! $value && ( 'billing_email' === $key ) ) {
		$user  = get_userdata( $user_id );
		$value = $user->user_email;
	}

	return $value;
}

function get_signed_in_user_initials(){
	$current_user = wp_get_current_user();
	$firstname = $current_user->user_firstname;
	$lastname = $current_user->user_lastname;

	if( ! empty( $firstname ) ){
		$initials = substr( $firstname , 0, 1 );
		if( ! empty( $lastname ) ){
			$initials .= substr( $lastname , 0, 1 );
		}
	} else if( ! empty( hpy_get_user_meta( $current_user->ID, 'shipping_first_name' ) ) && ! empty( hpy_get_user_meta( $current_user->ID, 'shipping_last_name' ) ) ){
		$initials = substr( hpy_get_user_meta( $current_user->ID, 'shipping_first_name' ) , 0, 1 ) . substr( hpy_get_user_meta( $current_user->ID, 'shipping_last_name' ), 0, 1 );
	} else {
		$name = explode( ' ', $current_user->display_name );
		if( count( $name ) > 0 ){
			$initials = substr( $name[0] , 0, 1 );
			if( count( $name ) > 1 ){
				$initials .= substr( $name[ count( $name ) - 1 ] , 0, 1 );
			}
		}else{
			$initials = 'N/A';
		}
	}

	return strtoupper( $initials );
}

function get_signed_in_user_firstname(){
	$current_user = wp_get_current_user();
	$firstname = $current_user->user_firstname;
	if( ! empty( $firstname ) ){
		return $firstname;
	} else if( ! empty( hpy_get_user_meta( $current_user->ID, 'shipping_first_name' ) ) ){
		return hpy_get_user_meta( $current_user->ID, 'shipping_first_name' );
	}
}

function hpy_get_account_page_link(){
	$myaccount_page_id = get_option( 'woocommerce_myaccount_page_id' );
	return $myaccount_page_id ? get_permalink( $myaccount_page_id ) : '';
}

add_action( 'woocommerce_before_account_orders', 'hpy_open_account_content_wrap', 10 );
add_action( 'woocommerce_before_account_orders', 'hpy_orders_title', 15 );
function hpy_open_account_content_wrap(){
	echo '<div class="row"><div class="col-mdlg-10 col-mdlg-offset-1 col-lg-8 col-lg-offset-2 col-xlg-7">';
}

function hpy_orders_title(){
	$opts = get_option( 'hpy_itb_shipping_lead_settings' );?>
	<header class="hpy-account-orders-header">
		<h2><?php _e('My Orders', 'hpy') ?></h2>
		<?php if( ! empty( $opts['disruption-enable'] ) && $opts['disruption-enable'] === 'enabled' &&  ! empty( $opts['disruption-message'] ) ) : ?>
			<div class="itb_alert_box alert_warning">
				<?php hpy_svg('warning'); ?>
				<p><strong><?php echo $opts['disruption-message']; ?></strong></p>
			</div>
		<?php endif ?>
	</header><?php
}

add_action('woocommerce_after_account_orders', 'close_single_div', 10);
add_action('woocommerce_after_account_orders', 'close_single_div', 15);

function get_order_delivery_method_img( $order ){

	$courier = $order->get_meta( '_hpy_delivery_method', true );

	switch ( $courier ) {

		case 'Royal Mail':
			$img_1x = THEME_IMAGES . 'delivery_methods/royal-mail.jpg';
			$img_2x = THEME_IMAGES . 'delivery_methods/royal-mail@2x.jpg';
			$img_3x = THEME_IMAGES . 'delivery_methods/royal-mail@3x.jpg';
			$alt_text = 'Royal Mail Logo';
			break;

		case 'APC':
			$img_1x = THEME_IMAGES . 'delivery_methods/apc-overnight.png';
			$img_2x = THEME_IMAGES . 'delivery_methods/apc-overnight@2x.png';
			$img_3x = THEME_IMAGES . 'delivery_methods/apc-overnight@3x.png';
			break;

		default:
			return '<p>' . ucwords( $courier ) . '</p>';
			break;

	}

	return '<img src="' .  $img_1x. '" srcset="' . $img_1x . ' 1x, ' . $img_2x . ' 2x, ' . $img_3x . ' 3x" alt="' . $alt_text . '">';
}

function get_order_tracking_number( $order ){

	$tracking_code = $order->get_meta( '_hpy_tracking_code', true );

	return $tracking_code;
}

function get_checkout_order_item( $item, $order ){
	$pers = wc_get_order_item_meta( $item->get_id(), 'hpy_personalisation_data' );
	$prod_id = wc_get_order_item_meta( $item->get_id(), '_product_id' );?>
	<div class="cr_product">
		<div class="cr_left">
			<?php $id = $item->get_variation_id() ? $item->get_variation_id() : $item->get_product_id();
			$product = wc_get_product( $id );
			$thumb_id = $product->get_image_id();
			$size = is_checkout() ? 'thumbnail' : 'woocommerce_thumbnail' ;
			$item_thumbnail = wp_get_attachment_image_src( $thumb_id, 'thumbnail', false );
			$item_enlarge = wp_get_attachment_image_src( $thumb_id, 'full-size', false );
			$order_thumb = "<a href='$item_enlarge[0]' data-fancybox><img src='$item_thumbnail[0]' /></a>";
			echo $order_thumb; ?>
		</div>
		<div class="cr_right">
			<div class="hpy_order_items">
				<div class="hpy_order_items_header">
					<p class="price"><?php echo $order->get_formatted_line_subtotal( $item ); ?></p>
					<p class="cr_product_title"><strong><?php echo apply_filters( 'woocommerce_order_item_name', $product_permalink ? sprintf( '<a href="%s">%s</a>', $product_permalink, $item->get_name() ) : $item->get_name(), $item, $is_visible ); ?></strong></p>
				</div>
				<?php if ( isset( $pers ) && !empty( $pers ) ) {  ?>
					<div class="order_item_extra"><?php get_order_item_meta( $item, '', $prod_id ); ?></div>
				<?php } ?>
			</div>
		</div>
	</div><?php
}

function get_friendly_personalisation_data( $personalisations, $productId, $variationId )
{
	$friendlyPersonalisations = [];

	$personalisationSettings = get_post_meta($productId, '_hpy_personalisation', true);
	if (!is_array($personalisationSettings)) {
		$personalisationSettings = (array)json_decode($personalisationSettings);
	}
	$personalisationSettings = (array)$personalisationSettings['personalisations'];

	// array of date field keys and their respective labels
	$dateFields = array(
		'Date' => 'Date', 
		'Datemarried' => 'Wedding Date', 
		'Date2' => 'Partner #1 Date', 
		'Date3' => 'Partner #2 Date',
		'Paper_Date' => 'Paper Date',
		'Date_Of_Birth' => 'Date Of Birth',
		'Start_Month' => 'Start Month'
	);

	$mdateFields = array('mdates' => 'Multiple');
	
	// iterate over all the personalisation data appended to the cart / order finding the labels
	
	foreach( $personalisations as $personalisationKey => $personalisation ) {

		$friendlyPersonalisation = null;

		// if the value is blank no point showing anything
		if(!$personalisation){
			continue;
		}

		if (array_key_exists($personalisationKey, $mdateFields)) {
			
			$headLableArr = array_keys($personalisation);
			$personalisationArr = array_values($personalisation);
			$personalisationBack = $personalisationArr[0];
			
			foreach ($personalisationBack as $pkey=>$personalisationGet) {
				if (is_array($personalisationGet) && isset($personalisationGet['date'])) {
					$day = '';
					$month = '';
					$year = '';
					
					$multipleDates = json_decode( json_encode( $personalisationSettings['multipleDates'] ), true );
					if ( is_array( $multipleDates ) ) {
						$multipleDates = array_values( $multipleDates );
						$multipleDates = $multipleDates[0];
					}
					
					foreach ( $personalisationGet as $date_key => $date_factor ) {
						$array_depth = array_depth( $date_factor );
						if( $array_depth == 2 ){
							$next_lable = array_values( $date_factor );
							$date_factor = $next_lable[0];
						}
						
						if(isset($date_factor['day'])){
							$day = $date_factor['day'];
						}
						if(isset($date_factor['month'])){
							$month = $date_factor['month'];
						}
						if(isset($date_factor['year'])){
							$year = $date_factor['year'];
						}
					}
					
					$date = get_formatted_paper_date($day, $month, $year);
				} else {
					$date = $personalisation;	
				}
				$lable_key = ucwords(str_replace('-',' ',$pkey));
				
				if ( isset($dateFields[$lable_key]) ) {
					$lableTitle = $dateFields[$lable_key];
				} else {
					$lableTitle = checktitleFromXML( $lable_key, $multipleDates ); 
				}
				$friendlyPersonalisations[] = [
					'label' => $lableTitle,
					'value' => $date,
				];
			}
			continue;
		}
		// deal with embossing
		/*
		if($personalisationKey == 'embossing') {
			$friendlyPersonalisations[] = [
				'label' => 'Embossing',
				'value' => $personalisation
			];
			continue;
		}
		*/
		
		if (array_key_exists($personalisationKey, $dateFields)) {
			
			if(is_array($personalisation) && isset($personalisation['date'])){
				$day = '';
				$month = '';
				$year = '';
				foreach($personalisation['date'] as $date_key => $date_factor){
					if(isset($date_factor['day'])){
						$day = $date_factor['day'];
					}
					if(isset($date_factor['month'])){
						$month = $date_factor['month'];
					}
					if(isset($date_factor['year'])){
						$year = $date_factor['year'];
					}
				}
				$date = get_formatted_paper_date($day, $month, $year);
			} else {
				$date = $personalisation;	
			}
			$friendlyPersonalisations[] = [
				'label' => $dateFields[$personalisationKey],
				'value' => $date,
			];	
			continue;		
		}

		// temporary
		if($personalisationKey == 'Cert_Presented') {
			$friendlyPersonalisations[] = [
				'label' => 'Presented To',
				'value' => $personalisation,
			];
			continue;
		}
		if($personalisationKey == 'Cert_Message') {
			$friendlyPersonalisations[] = [
				'label' => 'Message',
				'value' => $personalisation,
			];
			continue;
		}
		if($personalisationKey == 'Embossing') {
			continue;
		}
		if($personalisationKey == 'Embossing Choice') {
			$friendlyPersonalisations[] = [
				'label' => 'Embossing',
				'value' => 'Yes',
			];
			continue;
		}
		
		// deal with papers
		if($personalisationKey == 'papers') {
			
			$paper = 'string' === gettype( $personalisation[ 0 ] ) ? json_decode( $personalisation[ 0 ], true ) : $personalisation[0];
			if(!$paper && isset($personalisation[0])){
				$friendlyPersonalisations[] = [
					'label' => 'Title',
					'value' => $personalisation[0], 
				];
			} else {
				$friendlyPersonalisations[] = [
					'label' => 'Title',
					'value' => isset($paper['title']) ? $paper['title']: $paper, 
				];	
			}
			continue;
		}
		// deal with gift pack
		if($personalisationKey == 'giftpack') {
			$friendlyPersonalisations[] = [
				'label' => 'Gift Pack',
				'value' => $personalisation['name']
			];
			continue;
		}
		// deal with alcohol pack
		if($personalisationKey == 'giftpackpersonalised') {
			$friendlyPersonalisations[] = [
				'label' => 'Alcohol Pack',
				'value' => $personalisation['name']
			];
			continue;
		}
		// deal with new certificate
		if($personalisationKey == 'cert') {
			if($personalisation['selected']){
				$friendlyPersonalisations[] = [
					'label' => 'Certificate Presented To',
					'value' => $personalisation['presented']
				];
				$friendlyPersonalisations[] = [
					'label' => 'Certificate Occasion',
					'value' => $personalisation['occasion']
				];
				$friendlyPersonalisations[] = [
					'label' => 'Certificate Message',
					'value' => $personalisation['message']
				];
			}
			continue;
		}
		//multiple newspapers
		if ($personalisationKey == 'onj') {
			$categoryPrice = 0;
			foreach ($personalisation['giftpack']['multinewspapers'] as $multinewspapers) {
				$selectedPaperPID = (isset($multinewspapers['selectedPaperPID'])?$multinewspapers['selectedPaperPID']:0);
				$selectedPaperID = (isset($multinewspapers['selectedPaperID'])?$multinewspapers['selectedPaperID']:0);
				$charge_for_extra_national_papers = 0;
				$charge_for_extra_regional_papers = 0;
				if ( isset($selectedPaperPID) && $selectedPaperPID != '' ) {
					$charge_for_extra_national_papers = get_post_meta( $selectedPaperPID, 'charge_for_extra_national_papers', true );
					$charge_for_extra_regional_papers = get_post_meta( $selectedPaperPID, 'charge_for_extra_regional_papers', true );
				}
				$checkCategory = '';
				if ( isset($selectedPaperID) && $selectedPaperID != '' ) {
					$checkCategory = get_post_meta( $selectedPaperID, 'category', true );
					
				}
				if( $checkCategory == 'national' ){
					$categoryPrice = $charge_for_extra_national_papers;
				} elseif ( $checkCategory == 'regional' ) {
					$categoryPrice = $charge_for_extra_regional_papers;
				}
				if ($multinewspapers['selectedPaperDate']!='' && $multinewspapers['selectedPaperPrice']!='') {
					$friendlyPersonalisations[] = [
						'label' => $multinewspapers['selectedPaperDisplay'] ? $multinewspapers['selectedPaperDisplay'] : '',
						'value' => $multinewspapers['selectedPaperTitle'].'-"'.$multinewspapers['selectedPaperDate'].'"-'. get_woocommerce_currency_symbol(). $multinewspapers['selectedPaperPrice'] .' ( '.ucfirst( $checkCategory ) .' : '.get_woocommerce_currency_symbol().$categoryPrice.' )'
					];
				}
			}
			
		}
		// show upsells
		if ($personalisationKey == 'upsell') {
			$updated = false;
			foreach ($personalisation as $upsellID) {
				foreach ($personalisationSettings as $pers) {
					if ($pers->type == 'upsells') {
						foreach ($pers->upsells as $upsell) {
							if ($upsell->id == $upsellID) {
								$friendlyPersonalisations[] = [
									'label' => $pers->finishing ? 'Finishing Touch' : 'Upsell',
									'value' => $pers->description
								];
								$updated = true;
								break;
							}
						}
					}
				}
			}
			if ($updated) continue;
		}
		
		// add any labels that match settings from the product settings
		foreach( $personalisationSettings as $personalisationSetting ) {
			$personalisationSetting = (array)$personalisationSetting;
			if ( strtolower( $personalisationSetting['xml-value'] ) == strtolower( $personalisationKey ) ) {

				// deal with dates
				if($personalisationSetting['type']=='date'){
					foreach ( $personalisation['date'] as $dkey => $dvalue ) {
						$month                              = isset($dvalue[ 'month' ]) ? hpy_get_month_number( $dvalue[ 'month' ] ) : 'January';
						$day								= isset($dvalue[ 'day' ]) ? $dvalue[ 'day' ] : '01';
						$year								= isset($dvalue[ 'year' ]) ? $dvalue[ 'year' ] : '0000';
						$timestring                         = $month . ' ' . $day . ' ' . $year;
						$dateFormat							= isset($personalisationSetting['date-format']) ? $personalisationSetting['date-format'] : 'dmY';
						$date                               = date( $dateFormat, strtotime( $timestring ) );
						$personalisation 					= $date;
					}
				}

				$friendlyPersonalisation = [
					'label' => get_label_key($personalisationSetting['personalisations'], $personalisationKey),
					'value' => $personalisation
				];
				continue;
			}
		}

		// if we found it add to the array
		if($friendlyPersonalisation){
			$friendlyPersonalisations[] = $friendlyPersonalisation;
		}
	}
	
	// check if one of the personalisation settings is "variations"
	// if so, we need to note this for later
	if (isset($personalisationSettings['special']) && !empty($variationId)) {
		foreach ($personalisationSettings['special'] as $special) {
			if ($special->type == 'variations') {
				$variation = wc_get_product($variationId);
				
				$friendlyPersonalisations[] = [
					'label' => $variation->get_attribute_summary(),
					'value' => '-'
				];
			}
		}
	}
	
	// strip slashes from values for display
	foreach ($friendlyPersonalisations as $i => $personalisation) {
		$friendlyPersonalisations[$i]['value'] = is_array($personalisation['value']) ? array_map('stripslashes', $personalisation['value']) : stripslashes($personalisation['value']);
	}
	
	return $friendlyPersonalisations;
}
function checktitleFromXML($lable_key, $multipleDates) {
	$returnTitle = $lable_key;
	if (is_array($multipleDates)) {
		foreach ($multipleDates as $twArr) {
			if ($twArr['xml-value'] == strtolower($lable_key)) {
				$returnTitle = $twArr['label']; // label
			}
		}
	}
	return $returnTitle;
}
function get_formatted_paper_date($day, $month, $year)
{
	$fullMonth = hpy_get_month_number( $month );
	$timestring = $fullMonth . ' ' . $day . ' ' . $year;
	return date( 'jS-F-Y', strtotime( $timestring ) );
}

function get_order_item_meta( $item, $email = false, $prod_id = null )
{
	$pers = wc_get_order_item_meta( $item->get_id(), 'hpy_personalisation_data' );

	$personalisations = get_friendly_personalisation_data( $pers, $prod_id, $item->get_variation_id() );
	$pers_html = '';
	if( empty( $pers ) ){
		return;
	}
	
	echo '<table class="hpy_cart_personalisations">';

	foreach( $personalisations as $personalisation) 
	{
		if (isset($personalisation['value']) && !empty($personalisation['value'])) {
			$pers_html .= '<tr>';
			$pers_html .= '<th>' . $personalisation['label'] . '</th>';
			$pers_html .= '<td>';
			if ( is_array( $personalisation['value'] ) ) {
				foreach ( $personalisation['value']  as $v ) {
					$pers_html .= '<p style="margin:0;padding:0;">' . str_replace( array( '_', '-' ), ' ', $v ) . '</p>';
				}
			} else {
				$f = explode(PHP_EOL, $personalisation['value']);
				foreach( $f as $v ){
					if( ! empty( $v ) ){
						$pers_html .= '<p style="margin:0;padding:0;">' . str_replace( array( '_', '-' ), ' ', $v ) . '</p>';
					}
				}
			}
			$pers_html .= '</td>';
			$pers_html .= '</tr>';
		}
	}

	if ( isset( $pers_html ) && !empty( $pers_html ) ) {
		echo $pers_html;
	}
	echo '</table>';
}

function get_label_key( $data, $key ){
	foreach( $data as $pers ){
		if( $key === @$pers['xml-value'] ){
			return $pers['label'];
		}
	}

	return $key;
}

function edit_details_notice(){
	$link = get_field('privacy_policy_page', 'options');
	$link = ! empty( $link ) ? get_permalink( $link ) : home_url('/');
	?>
	<div class="edit-details-notice">
		<div class="edit-details-notice-top">
			<?php hpy_svg('shield-tick'); ?>
			<h3><?php _e('Your details are safe', 'hpy'); ?></h3>
		</div>
		<p><?php printf( __('We will never share your email with 3rd parties. Your personal data is protected by us in accordance with our <a href="%s">Privacy Policy</a>', 'hpy'), $link ) ?></p>
	</div><?php
}

/**
 * Register the Label product type after init
 */
function hpy_register_labels_product_type() {
	if( class_exists( 'WC_Product' ) ){
		class WC_Product_Labels extends WC_Product {
			public function __construct( $product ) {
				$this->product_type = 'labels';
				parent::__construct( $product );
			}
		}
	}
}
add_action( 'init', 'hpy_register_labels_product_type' );

function hpy_add_label_product( $types ){
	$types[ 'labels' ] = __( 'Label' );
	return $types;
}
add_filter( 'product_type_selector', 'hpy_add_label_product' );

if ( hpy_itb_should_display() ) {
	add_action('hpy_thankyou_share', 'hpy_share_order_links', 10, 1 );
}
function hpy_share_order_links( $order_id ){

    $social_networks = hpy_get_order_share_networks();

    if( ! empty( $social_networks ) ) : ?>
        <div class="hpy_ty_share">
            <div class="hpy_share_purchase">
                <span><?php _e('Share Your Purchase', 'hpy'); ?></span><?php

				$links = hpy_get_share_links( $order_id, $social_networks );

                foreach ($social_networks as $network) {
					$icon = get_hpy_svg($network);
                    $url = $links[$network];
					printf ('<a class="social-link social-%s" target="_blank" href="%s">%s<span class="screen-reader-text">%s %s</span></a>', $network, $url, $icon, __('Link to', 'hpy'), $network );
				}

            ?></div>
        </div><?php

    endif;
}

function hpy_get_order_share_networks(){
	return array('twitter', 'facebook');
}

function hpy_get_share_links( $order_id, $networks ){
	$title = __('Look what I just bought at ' . get_bloginfo( 'name' ) );
	$hashtags = '';
	$links = array();

	if( class_exists('acf') ){
		$twitter_title = get_field('twitter_title', 'options');
		$twitter_hashtags = get_field('twitter_hashtags', 'option');

		if( ! empty( $twitter_title ) ){
			$title = $twitter_title;
		}

		if( ! empty( $twitter_hashtags ) ){
			$hashtags = $twitter_hashtags;
		}
	}

	$order = new WC_Order ($order_id);
	$items = $order->get_items();
	$product= end($items);

	$wc_product = wc_get_product( $product['product_id'] );
	$product_image = wp_get_attachment_image_src( $wc_product->get_image_id(), 'full' );
	$desc = strip_tags( preg_replace( '/\[.*?\]/', '', $wc_product->get_description() ), '<ul><nav><li><p><a>' );
	$product_description_raw = strlen ($desc) >= 140 ? substr ($desc, 0, strpos ($desc, ' ', 140)).'...' : $desc;
	$product_description = strip_tags($product_description_raw);

	foreach ($networks as $network) {

		switch ($network) {

			case 'twitter':
				$links['twitter'] = 'https://twitter.com/intent/tweet?text=' . urlencode( $title ) . '&url=' . $wc_product->get_permalink() . '&hashtags=' . $hashtags;
				break;

			case 'facebook':
				$links['facebook'] = 'https://www.facebook.com/sharer/sharer.php?s=100&p[url]=' . $wc_product->get_permalink() . '&p[images][0]=' . $product_image[0] . '&p[summary]=' . $product_description;
				break;
		}
	}

	return $links;
}

remove_action( 'woocommerce_cart_is_empty', 'wc_empty_cart_message', 10 );
add_action( 'woocommerce_cart_is_empty', 'hpy_empty_cart' );

function hpy_empty_cart(){ ?>
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 hpy-cart-empty-wrap">
				<p class="hpy-empty-basket"><?php esc_html_e('Your basket is empty', 'hpy'); ?></p>
				<?php itb_button('a', get_hpy_svg('basket-icon') . __('Please click here to continue shopping', 'hpy'), array(
					'href' => esc_url( home_url('/') ),
					'class' => 'green-button',
				) ) ?>
			</div>
		</div>
	</div><?php

}

function hpy_get_order_reference( $order ) {

	if ( $order_ref = $order->get_meta( '_hpy_order_reference', true ) ) {
		return $order_ref;
	} else {
		return trim( str_replace( '#', '', $order->get_order_number() ) );
	}

}

function hpy_get_customer_code( $input, $type = 'order' ) {

	if ( $type == 'order' || $type == 'securetrading' ) {
		$customers_currency = $input->get_currency();
	} else {
		$customers_currency = hpy_itb_get_current_currency();
	}


	if ( $type == 'order' || $type == 'securetrading' ) {
		$customer = $input->get_user_id();

		$input = new WC_Customer( $customer );
	}

	if ( $source_code = get_user_meta( $input->get_id(), '_hpy_source_code', true ) ) {
		return $source_code;
	} else {
		if ($type == 'securetrading') {
			switch ( $customers_currency ) {
				case 'GBP' :
					return 'HN';
					break;
	
				case 'EUR':
					return 'HN';
					break;
	
				case 'USD':
					return 'HNUS';
					break;
	
				case 'CAD':
					return 'HN';
					break;
	
				case 'AUD':
					return 'HN';
					break;
			}
		} else {
			switch ( $customers_currency ) {
				case 'GBP' :
					return 'NET';
					break;
	
				case 'EUR':
					return 'NET';
					break;
	
				case 'USD':
					return 'HISUS';
					break;
	
				case 'CAD':
					return 'NET';
					break;
	
				case 'AUD':
					return 'NET';
					break;
			}
		}
	}

}

//add_action( 'woocommerce_after_add_attribute_fields', 'hpy_woocommerce_after_add_attribute_fields' );
//add_action( 'woocommerce_after_edit_attribute_fields', 'hpy_woocommerce_after_add_attribute_fields' );
function hpy_woocommerce_after_add_attribute_fields() {

	global $wpdb;

	$edit = absint( $_GET['edit'] );

	$attribute_to_edit = $wpdb->get_row( 'SELECT attribute_type, attribute_label, attribute_name, attribute_orderby, attribute_public FROM ' . $wpdb->prefix . "woocommerce_attribute_taxonomies WHERE attribute_id = '$edit'" );

	$att_display = $attribute_to_edit->attribute_display;
	$att_tooltip = $attribute_to_edit->attribute_tooltip;
	$att_description = $attribute_to_edit->attribute_description;
	?>

	<tr class="form-field form-required">
		<th scope="row" valign="top">
			<label for="attribute_display"><?php esc_html_e( 'Display Name', 'woocommerce' ); ?></label>
		</th>
		<td>
			<input name="attribute_display" id="attribute_display" type="text" value="<?php echo esc_attr( $att_display ); ?>" />
			<p class="description"><?php esc_html_e( 'The name to be displayed on the Personalisation overview', 'hpy' ); ?></p>
		</td>
	</tr>
	<tr class="form-field form-required">
		<th scope="row" valign="top">
			<label for="attribute_tooltip"><?php esc_html_e( 'Tooltip', 'woocommerce' ); ?></label>
		</th>
		<td>
			<input name="attribute_tooltip" id="attribute_tooltip" type="text" value="<?php echo esc_attr( $att_tooltip ); ?>" />
			<p class="description"><?php esc_html_e( 'A Tooltip to allow for clear instructions to the customer', 'hpy' ); ?></p>
		</td>
	</tr>
	<tr class="form-field form-required">
		<th scope="row" valign="top">
			<label for="attribute_description"><?php esc_html_e( 'Description', 'woocommerce' ); ?></label>
		</th>
		<td>
			<input name="attribute_description" id="attribute_description" type="text" value="<?php echo esc_attr( $att_description ); ?>" />
			<p class="description"><?php esc_html_e( 'Descrption for the attribute, Should help the customer understand what this is for', 'hpy' ); ?></p>
		</td>
	</tr>
	<?php
}

add_action( 'hpy_save_attribute_meta', 'hpy_save_attribute_meta' );
function hpy_save_attribute_meta() {

	$description = $_POST;

	echo '';
	wp_die();

}

add_action('woocommerce_email_header', 'add_css_to_email');

function add_css_to_email() {
	echo '
	<style type="text/css">
	@import url("https://fonts.googleapis.com/css?family=Nanum+Pen+Script");
	</style>
	';
}

function hpy_itb_is_uk_site() {
	$is_uk_site = false;
	$site_base = wc_get_base_location();

	if ( $site_base['country'] == 'GB' ) {
		$is_uk_site = true;
	}

	return $is_uk_site;

}

function hpy_itb_get_us_site() {

	$us_site = hpy_itb_server_protocol() . $_SERVER['SERVER_NAME'] . '/en-us/';

	return $us_site;

}

function hpy_itb_get_uk_site() {

	$uk_site = hpy_itb_server_protocol() . $_SERVER['SERVER_NAME'] . '/en-gb/';

	return $uk_site;

}

function hpy_itb_server_protocol(){
	return stripos($_SERVER['SERVER_PROTOCOL'],'https') === true ? 'https://' : 'https://';
}

function hpy_itb_is_site( $site ){
	return $site == admin_url('/') ? true : false;
}

function hpy_itb_get_currency_label( $key ) {

	switch ($key) {
		case 'gb' :
			return 'GBP';
			break;

		case 'ie':
			return 'EUR';
			break;

		case 'us':
			return 'USD';
			break;

		case 'ca':
			return 'CAD';
			break;

		case 'au':
			return 'AUD';
			break;
	}

}

add_filter( 'wc_aelia_cs_converted_amount', 'hpy_itb_round_converted_price', 9999, 1 );
add_filter( 'wc_aelia_cs_convert_product_price', 'hpy_itb_round_converted_price', 9999, 1 );
add_filter( 'hpy_wc_aelia_converted_amount', 'hpy_itb_round_converted_price', 9999, 2 );
function  hpy_itb_round_converted_price( $price, $personalisation = false, $dontRound = false ) {
	$current_currency = hpy_itb_get_current_currency() ? hpy_itb_get_current_currency() : 'GBP';
	$main_currency = hpy_itb_is_uk_site() ? 'GBP' : 'USD';

	if ( $main_currency !== $current_currency ) {

		$price = ( ceil($price * 2 )/2 );
		if ( $dontRound || $current_currency == 'AUD' && $personalisation ) {
			return $price;
		}

		$price = $price - 0.01;

	}

	return $price;
}

add_filter( 'hpy_itb_display_one_day_delivery', 'hpy_itb_display_one_day_delivery', 10, 1 );
function hpy_itb_display_one_day_delivery( $bool ) {
	$current_currency = hpy_itb_get_current_currency();
	$main_currency = hpy_itb_is_uk_site() ? 'GBP' : 'USD';

	if ( $main_currency !== $current_currency ) {
		$bool = false;
	}

	return $bool;
}

function hpy_itb_get_current_currency() {
	if ( $currency = get_woocommerce_currency() ) {
		return $currency;
	} else {
		return '';
	}
}

function hpy_check_attribute_override( $product, $type ) {
	$terms = get_the_terms ( $product->get_id(), 'product_cat' );
	$override = get_field( 'product_' . $type , $product->get_id() ) ? get_field( 'product_' . $type , $product->get_id() ) : get_field( 'category_description', $terms[0] );

	return $override;
}

add_filter( 'hpy_itb_delivery_code', 'hpy_itb_delivery_code' );

function hpy_itb_delivery_code( $delivery ) {

	global $post;
	$order = wc_get_order( $post->ID );

	if ( !empty( $order ) ) {
		$currency = $order->get_currency();
	}

	if ( !empty( $currency ) ) {
		if ( hpy_itb_get_current_currency() !== 'GBP' || $currency !== 'GBP' ) {

			if ( strpos( strtolower( $delivery ), 'urgent' ) !== false ) {
				return 'EXP';
			} else if ( strpos( strtolower( $delivery ), 'priority' ) !== false ) {
				return 'EXP1';
			} else {
				return 'STD';
			}

		}
	} else {
		if ( hpy_itb_get_current_currency() !== 'GBP' ) {

			if ( strpos( strtolower( $delivery ), 'urgent' ) !== false ) {
				return 'EXP';
			} else if ( strpos( strtolower( $delivery ), 'priority' ) !== false ) {
				return 'EXP1';
			} else {
				return 'STD';
			}

		}
	}


	if ( strpos( strtolower( $delivery ), 'urgent' ) !== false ) {
		$return = 'EXP';
	} else {
		switch ($delivery) {

			case 'Royal Mail 48':
				$return = 'STD';
				break;

			case 'Royal Mail 24':
				$return = 'EXP1';
				break;

			default :
				$return = 'STD';
				break;

		}
	}

	return $return;

}

// add_filter('woocommerce_before_output_product_categories', 'hpy_before_product_categories_output');
// function hpy_before_product_categories_output( $html ){
//     return '<li class="product_cat_wrap"><ul>';
// }
// add_filter('woocommerce_after_output_product_categories', 'hpy_after_product_categories_output');
// function hpy_after_product_categories_output( $html ){
//     return '</ul></li>';
// }

add_action( 'woocommerce_product_query_tax_query', 'hpy_product_query' );
function hpy_product_query( $tax_query ){
	if( is_product_category() || is_product_tag() || is_shop() ) :
		$id = get_queried_object_id();
		$format = get_field('products_to_show', 'product_cat_' . $id);
		if( ! is_null( $format ) && 'child' == $format ) :
			$tax_query[] = array(
				'taxonomy' => 'product_cat',
				'field' => 'term_id',
				'terms' => $id,
				'include_children' => false,
			);
		endif;

    endif;

    return $tax_query;
}

add_action( 'admin_menu', 'hpy_itb_variable_to_simple_menu' );

function hpy_itb_variable_to_simple_menu() {
	add_submenu_page( 'options-general.php', 'Variable Fix', 'Variable Fix', 'manage_options', 'var-fix', 'hpy_var_fix_callback' );
}

function hpy_var_fix_callback () {
	?>
	<form enctype="multipart/form-data" id="import-upload-form" method="post" action="">
		<p class="submit">
			<input type="submit" class="button" id="hpy-ai-trigger-var-fix" value="<?php esc_attr_e('Variable Products to Simple'); ?>"/>
		</p>
	</form>
	<?php
}

function hpy_itb_should_display() {
	// return is_user_privileged();
	return true;
}

function is_user_privileged(){
	if ( is_user_logged_in() ) {
		$user = wp_get_current_user();
		$role = ( array ) $user->roles;
		if ( in_array( 'administrator', $role ) || in_array( 'shop_manager', $role ) ) {
			return true;
		}
	}
	return false;
}

add_filter( 'woocommerce_structured_data_product_offer', 'itb_filter_product_offer_schema', 10, 2 );
function itb_filter_product_offer_schema( $markup, $product ){
	if( $product->is_type('variable') ){
		$variations = $product->get_available_variations();
		$markup['offerCount'] = count( $variations );
	}
	
	// if we're on a page which has it's own from price set, use it
	$queried_object = get_queried_object();
	$price = $markup['price'];
	if (have_rows('category_content_blocks', $queried_object)) {
		while (have_rows('category_content_blocks', $queried_object)) {
			the_row();
			if (get_row_layout() == 'image_left_text_right') {
				$price = get_sub_field('type_1_from_price');
			} elseif (get_row_layout() == 'text_left_image_right') {
				$price = get_sub_field('type_3_from_price');
			} elseif (get_row_layout() == 'image_left_text_right_type_2') {
				$price = get_sub_field('type_2_from_price');
			} elseif (get_row_layout() == 'image_left_text_right_type_3') {
				$price = get_sub_field('type_5_from_price');
			} elseif (get_row_layout() == 'image_left_text_right_type_3') {
				$price = get_sub_field('type_4_from_price');
			}
		}
	}

	if (!empty($price)) {
		$markup['price'] = $price;
		$markup['priceSpecification']['price'] = $price;
	}
	
	return $markup;
}

add_filter( 'woocommerce_structured_data_product', 'itb_filter_product_schema', 10, 2 );
function itb_filter_product_schema( $markup, $product ){
	$id = $product->get_id();
	
    if( HPY_ITB_Trustpilot_API::reviews_enabled() ){        
		$total = HPY_ITB_Trustpilot_API::get_product_review_total_meta( $id );
        if( $total > 0 ){
            $markup['aggregateRating'] = array(
                '@type'       => 'AggregateRating',
                'ratingValue' => number_format( HPY_ITB_Trustpilot_API::get_product_rating_meta( $id ), 2 ),
                'reviewCount' => $total,
			);
			
            $review_collection = array();
			$reviews = HPY_ITB_Trustpilot_API::get_product_reviews_meta($id);
			
            if( ! empty( $reviews ) ) { 
                foreach( $reviews as $review ){
                    $review_collection[] = itb_map_review_schema( $review );
                }
            }

            if( ! empty( $review_collection ) ){
                $markup['review'] = array_filter( $review_collection );
            }else{
                unset( $markup['aggregateRating'] );
            }
        }
    }else{
        unset( $markup['aggregateRating'] );
	}
	
    $ISBN = get_post_meta( $id, '_cpf_ean', true );
    if( ! empty( $ISBN ) ){
        $markup['gtin13'] = trim( str_replace( 'ISBN', '', $ISBN ) );
    }

    return $markup;

}

function itb_map_review_schema( $comment ){
    $markup                  = array();
    $markup['@type']         = 'Review';
    // $markup['@id']           = get_comment_link( $comment->comment_ID );
    $markup['datePublished'] = $comment['createdAt'];
	$markup['description']   = $comment['text'];
	if(isset($comment['product'])){
		$markup['itemReviewed']  = array(
			'@type' => 'Product',
			'name'  => $comment->product->name,
		);
	}

    // Skip replies unless they have a rating.
    $rating = $comment['stars'];

    if ( $rating ) {
        $markup['reviewRating'] = array(
            '@type'       => 'rating',
            'ratingValue' => $rating,
        );
	}
		
    $markup['author'] = array(
        '@type' => 'Person',
        'name'  => $comment['consumer']['displayName'],
    );

    return $markup;
}

add_filter('wp_head', 'itb_generate_organisation_schema');
function itb_generate_organisation_schema(){

	$trust_pilot_include_schema = false;

    // front page/ blog listing page or a page template that may have reviews included
	if( !is_front_page() && !is_home() && !is_product_category() && !get_page_template_slug()=='template-hn-category-designed.php' ) return;
	
	// if it is a page check if reviews are enabled
	if(get_page_template_slug()=='template-hn-category-designed.php' || is_product_category()){

		if(is_product_category()){
			$term = get_queried_object();
			$trust_pilot_include_schema = get_field('trust_pilot_include_schema', $term->taxonomy . '_' . $term->term_id);

			if(!$trust_pilot_include_schema){
				// dig the the include schema and product id out of the acf rows
				$designed_category_template = get_field('designed_category_template', $term);
				if (in_array('enable', $designed_category_template) || in_array('enablesports', $designed_category_template) ) {
					while( have_rows('category_content_blocks', $term) ) {
						the_row();
						if(get_row_layout()!='text_and_reviews') continue;
						$trust_pilot_product = get_sub_field('trust_pilot_product');
						$trust_pilot_include_schema = get_sub_field('trust_pilot_include_schema');
						if($trust_pilot_include_schema) break;
					}
				}
			}
		}
		else
		{
			// dig the the include schema and product id out of the acf rows
			while( have_rows('category_content_blocks') ) {
				the_row();
				if(get_row_layout()!='text_and_reviews') continue;
				$trust_pilot_product = get_sub_field('trust_pilot_product');
				$trust_pilot_include_schema = get_sub_field('trust_pilot_include_schema');
				if($trust_pilot_include_schema) break;
			}
		}

		reset_rows();

		// if it's product based review
		if($trust_pilot_product && $trust_pilot_include_schema){
			$product = wc_get_product($trust_pilot_product);
			$wc = new WC_Structured_Data();
			$wc->generate_product_data( $product );
			$data = $wc->get_data();

			// WC_Structured_Data actually outputs schema in the footer automatically if it exists
			// so we end up with duplicates, so we need to remove it after generating it
			$wc->set_data(array('@type' => 'ignore'), true);

			// WC_Structured_Data has problems generating some required 
			// schema parameters
			if (!isset($data[0]['@context'])) {
				$missing_data = array(
					'@context' => 'https://schema.org/',
					'sku' => $product->get_sku()
				);
				$data[0] = array_merge($missing_data, $data[0]);
			}

			echo '<script type="application/ld+json">' . wp_json_encode( $data ) . '</script>';

			return;
		}

		// if include schema not selected don't do anything else
		if(!$trust_pilot_include_schema) return;
	}

	global $wp;

	$data['@context'] = 'https://schema.org/';
	$data['@type'] = "Organization";
	$data['url'] = home_url( $wp->request );
	$data['name'] = get_bloginfo( 'name' );

	$data['sameAs'] = [
		'https://uk.trustpilot.com/review/www.historic-newspapers.co.uk',
		'https://www.facebook.com/HistoricNewspapers',
		'https://twitter.com/HistoricPapers',
		'https://plus.google.com/+Historic-newspapersCouk',
		'https://www.instagram.com/historic.newspapers/'
	];

	$contact_points = array();
	$phone = get_theme_mod('site_phone');
	if( ! empty( $phone ) ){
		$contact_points[] = array(
			'@type' => 'ContactPoint',
			'contactType' => 'customer service',
			'telephone' => str_replace( ' ','', get_theme_mod('site_phone') )
		);
	}

	$data['contactPoint'] = $contact_points;

	// if we're including the service review schema
	if($trust_pilot_include_schema){
		$total = HPY_ITB_Trustpilot_API::get_business_review_total_meta();
        if( $total > 0 ){
            $data['aggregateRating'] = array(
                '@type'       => 'AggregateRating',
                'ratingValue' => number_format( HPY_ITB_Trustpilot_API::get_business_rating_meta(), 2 ),
                'reviewCount' => $total,
            );

            $review_collection = array();
			$reviews = HPY_ITB_Trustpilot_API::get_business_reviews_meta(0,5);
			
            if( ! empty( $reviews ) ) { 
                foreach( $reviews as $review ){
                    $review_collection[] = itb_map_review_schema( $review );
                }
            }

            if( ! empty( $review_collection ) ){
                $data['review'] = array_filter( $review_collection );
            }else{
                unset( $data['aggregateRating'] );
            }
        }
	}

	echo '<script type="application/ld+json">' . wp_json_encode( $data ) . '</script>';
}

add_filter('woocommerce_process_registration_errors', 'hpy_process_registration_errors', 10, 4 );
function hpy_process_registration_errors( $validation_error, $username, $password, $email ){
    global $woocommerce;

    $wc_session = $woocommerce->session;
    $error = array();

    if ( empty( $email ) || ! is_email( $email ) ) {
        $error[] = __( 'Please provide a valid email address.', 'woocommerce' );
    }

    if ( email_exists( $email ) ) {
        $error[] = apply_filters( 'woocommerce_registration_error_email_exists', __( 'An account is already registered with your email address. Please log in.', 'woocommerce' ), $email );
    }

    if ( 'no' === get_option( 'woocommerce_registration_generate_username' ) || ! empty( $username ) ) {
        $username = sanitize_user( $username );

        if ( empty( $username ) || ! validate_username( $username ) ) {
            $error[] = __( 'Please enter a valid account username.', 'woocommerce' );
        }

        if ( username_exists( $username ) ) {
            $error[] = __( 'An account is already registered with that username. Please choose another.', 'woocommerce' );
        }
    }

    if ( 'yes' !== get_option( 'woocommerce_registration_generate_password' ) && empty( $password ) ) {
        $error[] = __( 'Please enter an account password.', 'woocommerce' );
    }

    if( $password !== $_POST['confirm_password'] ){
        $error[] = __("Passwords don't match", 'hpy');
        $wc_session->set('hpy_registration_errors', json_encode( $error ) );
        return new WP_Error( 'passwords-no-match', "Passwords don't match" );
    }


    if ( ! empty( $error ) ) {
        $wc_session->set('hpy_registration_errors', json_encode( $error ) );
    }

    return $validation_error;
}

if ( ! hpy_itb_should_display() ) {
    remove_action('woocommerce_before_add_to_cart_button', 'hpy_product_personalisations', 3 );
    remove_action( 'woocommerce_single_product_summary', 'woocommerce_template_single_add_to_cart', 30 );
    remove_action( 'woocommerce_simple_add_to_cart', 'woocommerce_simple_add_to_cart', 30 );
    remove_action( 'woocommerce_grouped_add_to_cart', 'woocommerce_grouped_add_to_cart', 30 );
    remove_action( 'woocommerce_variable_add_to_cart', 'woocommerce_variable_add_to_cart', 30 );
    remove_action( 'woocommerce_external_add_to_cart', 'woocommerce_external_add_to_cart', 30 );
    remove_action( 'woocommerce_single_variation', 'woocommerce_single_variation', 10 );
    remove_action( 'woocommerce_single_variation', 'woocommerce_single_variation_add_to_cart_button', 20 );

    add_action( 'woocommerce_single_product_summary', 'hpy_coming_soon', 30 );

}

function hpy_coming_soon(){
    itb_button('div', __('Coming Soon', 'hpy'), array(
        'class' => 'grey-button coming-soon',
        'style' => 'pointer-events:none;'
    ) );
}

remove_action( 'woocommerce_review_meta', 'woocommerce_review_display_meta', 10 );

add_filter( 'hpy_itb_get_complete_order', 'hpy_itb_get_complete_order', 10, 1 );
function hpy_itb_get_complete_order( $order_number ) {

	$prepend = hpy_get_customer_code( wc_get_order( $order_number ), 'securetrading' );

	$return = ( $prepend ? $prepend : '' ) . $order_number;

	if ( WP_ENV == 'staging' || WP_ENV == 'development' ) {
		$return = $return . '_test';
	}

	return $return;

}

add_action( 'init', 'hpy_empty_cart_url' );
function hpy_empty_cart_url() {
    global $woocommerce;
	if ( isset( $_GET['empty-cart'] ) ) {
		$woocommerce->cart->empty_cart( true );
	}
}

function detect_newspaper_books(){
	global $product;

	if( class_exists('acf') && is_product() ){
		$is_newspaper = get_field( 'is_newspaper', $product->get_id() );
        $is_newspaper = ! empty( $is_newspaper ) && false !== array_search( 'yes', $is_newspaper ) ? true : false ;
        if( $is_newspaper ){
            return true;
        }
	}

	return false;
}

function detect_football_books(){
	global $product;
    if( class_exists('acf') && is_product() ){
        $is_football = get_field( 'is_newspaper', $product->get_id() );
		$is_football = ! empty( $is_football ) && false !== array_search( 'foot', $is_football ) ? true : false ;
        if(  $is_football ){
            return true;
        }
	}

	return false;
}

function detect_onj($_product = null){
	if(!$_product && is_product()){
		global $product;
		$_product = $product;
	}
    if( class_exists('acf') && $_product ){
		$is_onj = get_field( 'template_type', $_product->get_id() );
		$is_onj = ($is_onj=='onj');
        if(  $is_onj ){
            return true;
        }
	}

	return false;
}

function get_product_display_setting(){
	global $product;
    if( class_exists('acf') && is_product() ){
		return get_field( 'display_option', $product->get_id() );
	}
	return false;
}

add_action( 'woocommerce_product_after_variable_attributes', 'hpy_itb_variation_settings_fields', 10, 3 );
add_action( 'woocommerce_product_after_variable_attributes_js', 'hpy_itb_variable_fields_js' );
add_action( 'woocommerce_process_product_meta_variable', 'hpy_itb_save_variation_settings_fields', 10, 2 );
add_action( 'woocommerce_save_product_variation', 'hpy_itb_save_variation_settings_fields', 10, 2 );


function hpy_itb_variation_settings_fields( $loop, $variation_data, $variation ) {
	?>
	<tr>
		<td>
			<?php
			woocommerce_wp_text_input( array(
					'id' => 'paper_code[' . $loop . ']',
					'class' => 'short',
					'label' => __( 'Paper Code', 'hpy' ),
					'value' => get_post_meta( $variation->ID, 'paper_code', true )
				)
			);

			woocommerce_wp_text_input( array(
					'id' => 'tag_text[' . $loop . ']',
					'class' => 'short',
					'label' => __( 'Tag Text', 'hpy' ),
					'value' => get_post_meta( $variation->ID, 'tag_text', true )
				)
			);

			woocommerce_wp_select( array(
					'id' => 'tag_class[' . $loop . ']',
					'class' => 'short',
					'label' => __( 'Tag Class', 'hpy' ),
					'value' => get_post_meta( $variation->ID, 'tag_class', true ),
					'options' => array(
						'blue' => 'Blue',
						'red' => 'Red',
						'yellow' => 'Yellow',
						'green' => 'Green',
						'grey' => 'Grey',
					),
				)
			);
			?>
		</td>
	</tr>
	<?php
}

function hpy_itb_variable_fields_js() {
	?>
	<tr>
		<td>
			<?php
			woocommerce_wp_text_input( array(
					'id' => 'tag_text[ + loop + ]',
					'class' => 'short',
					'label' => __( 'Paper Code', 'hpy' ),
					'value' => ''
				)
			);

			woocommerce_wp_text_input( array(
					'id' => 'tag_text[ + loop + ]',
					'class' => 'short',
					'label' => __( 'Tag Text', 'hpy' ),
					'value' => ''
				)
			);

			woocommerce_wp_select( array(
					'id' => 'tag_class[ + loop + ]',
					'class' => 'short',
					'label' => __( 'Tag Class', 'hpy' ),
					'value' => '',
					'options' => array(
						'blue' => 'Blue',
						'red' => 'Red',
						'yellow' => 'Yellow',
						'green' => 'Green',
						'grey' => 'Grey',
					),
				)
			);
			?>
		</td>
	</tr>
	<?php
}

function hpy_itb_save_variation_settings_fields( $post_id ){
	if (isset($_POST['variable_sku'])) :
		$variable_sku = $_POST['variable_sku'];
		$variable_post_id = $_POST['variable_post_id'];

		// Text Field
		$_paper_code = $_POST['paper_code'];
		$_text_field = $_POST['tag_text'];
		$_class_field = $_POST['tag_class'];
		foreach ($_paper_code as $key => $value) {
			$variation_id = (int)$variable_post_id[$key];
			if (isset($value)) {
				update_post_meta($variation_id, 'paper_code', stripslashes($value));
			}
		}
		foreach ($_text_field as $key => $value) {
			$variation_id = (int)$variable_post_id[$key];
			if (isset($value)) {
				update_post_meta($variation_id, 'tag_text', stripslashes($value));
			}
		}
		foreach ($_class_field as $key => $value) {
			$variation_id = (int)$variable_post_id[$key];
			if (isset($value)) {
				update_post_meta($variation_id, 'tag_class', stripslashes($value));
			}
		}
	endif;
}

add_action( 'woocommerce_save_product_variation', 'hpy_itb_save_custom_field_variations', 99, 2 );
function hpy_itb_save_custom_field_variations( $variation_id, $i ) {
	$paper_code = $_POST['paper_code'][$i];
	$tag_text = $_POST['tag_text'][$i];
	$tag_class = $_POST['tag_class'][$i];
	if ( ! empty( $paper_code ) ) {
		update_post_meta( $variation_id, 'paper_code', esc_attr( $paper_code ) );
	} else delete_post_meta( $variation_id, 'paper_code' );

	if ( ! empty( $tag_text ) ) {
		update_post_meta( $variation_id, 'tag_text', esc_attr( $tag_text ) );
	} else delete_post_meta( $variation_id, 'tag_text' );

	if ( ! empty( $tag_class ) ) {
		update_post_meta( $variation_id, 'tag_class', esc_attr( $tag_class ) );
	} else delete_post_meta( $variation_id, 'tag_class' );
}

function hpy_output_cart_item_error( $key ){
	if( ! empty( $_GET['error_item'] ) && ! empty( $_GET['error_message'] ) && $_GET['error_item'] === $key ){
		echo '<ul class="hpy-error"><li>' . $_GET['error_message'] . '</li></ul>';
	}
}

add_filter( 'woocommerce_form_field_text', 'itb_woocommerce_text_field', 10, 4 );
function itb_woocommerce_text_field( $field, $key, $args, $value ){
	if( $key === "shipping_address_google" || $key === "billing_address_google" ){
		$field = str_replace( '(optional)', '', $field );
	}
	return $field;
}

//Overwrite Order number with the full source code too
//add_action( 'woocommerce_my_account_my_orders_column_order-number', 'hpy_my_account_order_number', 10, 1 );
add_action( 'woocommerce_order_number', 'hpy_my_account_order_number', 10, 2 );
function hpy_my_account_order_number( $order_number, $order ) {

	$prefix = 'HN';
	if (defined('SITE_CODE') && SITE_CODE == 'us') {
		$prefix = 'HNUS';
	}
	$order_number = $prefix.$order_number;

	if ( WP_ENV == 'staging' || WP_ENV == 'development' ) {
		$order_number = $order_number . '_test';
	}

	return $order_number;

}

add_action( 'woocommerce_product_options_inventory_product_data', 'hpy_tp_add_identifier_field' );
add_action( 'woocommerce_process_product_meta', 'hpy_tp_save_identifier_field' );


function hpy_tp_add_identifier_field() {
	global $woocommerce, $post;

	echo '<div class="options_group show_if_simple show_if_variable">';

	woocommerce_wp_text_input(
		array(
			'id'          => '_tp_unique_identifier',
			'label'       => __( 'Unique Identifier', 'hpy' ),
			'placeholder' => hpy_tp_get_next_number(),
			'desc_tip'    => 'true',
			'description' => __( 'Enter the Unique Identifier if not already present', 'hpy' ),
		)
	);

	woocommerce_wp_text_input(
		array(
			'id'          => '_tp_legacy_override',
			'label'       => __( 'Trust Pilot Override', 'hpy' ),
			'placeholder' => '',
			'desc_tip'    => 'true',
			'description' => __( 'If you want a different id used for trust pilot enter here', 'hpy' ),
		)
	);

	woocommerce_wp_text_input(
		array(
			'id'          => '_vendor_code',
			'label'       => __( 'Vendor Code', 'hpy' ),
			'placeholder' => '',
			'desc_tip'    => 'true',
			'description' => __( 'Used for warehouse xml', 'hpy' ),
		)
	);

	echo '</div>';
	echo '<div class="options_group show_if_simple">';

	woocommerce_wp_text_input(
		array(
			'id'          => 'paper_code',
			'label'       => __( 'Paper Code', 'hpy' ),
			'placeholder' => '',
			'desc_tip'    => 'true',
			'description' => __( 'Enter the Paper Code.', 'hpy' ),
		)
	);

	woocommerce_wp_text_input(
		array(
			'id'          => 'paper_price_code',
			'label'       => __( 'Paper Price Code', 'hpy' ),
			'placeholder' => '',
			'desc_tip'    => 'true',
			'description' => __( 'Enter the Paper Price Code.', 'hpy' ),
		)
	);

	echo '</div>';
}

function hpy_tp_save_identifier_field( $post_id ) {

	$woocommerce_text_field = $_POST['_tp_unique_identifier'];
	if( !empty( $woocommerce_text_field ) )
		update_post_meta( $post_id, '_tp_unique_identifier', esc_attr( $woocommerce_text_field ) );

	$legacy_override = $_POST['_tp_legacy_override'];
	if( !empty( $legacy_override ) )
		update_post_meta( $post_id, '_tp_legacy_override', esc_attr( $legacy_override ) );

	$vendor_code = $_POST['_vendor_code'];
		if( !empty( $vendor_code ) )
			update_post_meta( $post_id, '_vendor_code', esc_attr( $vendor_code ) );

	$paper_code = $_POST['paper_code'];
	if( !empty( $paper_code ) )
		update_post_meta( $post_id, 'paper_code', esc_attr( $paper_code ) );

}

add_action( 'woocommerce_variation_options_pricing', 'so_add_custom_field_to_variations', 10, 3 );
add_action( 'woocommerce_save_product_variation', 'so_save_custom_field_variations', 10, 2 );
add_filter( 'woocommerce_available_variation', 'so_add_custom_field_variation_data' );

 
function so_add_custom_field_to_variations( $loop, $variation_data, $variation ) {
	woocommerce_wp_text_input( 
		array(
			'id' => '_vendor_code[' . $loop . ']',
			'class' => 'short',
			'label' => __( 'Vendor Code', 'hpy' ),
			'value' => get_post_meta( $variation->ID, '_vendor_code', true )
		)
	);
}
 
function so_save_custom_field_variations( $variation_id, $i ) {
	$_vendor_code = $_POST['_vendor_code'][$i];
	if ( isset( $_vendor_code ) ) update_post_meta( $variation_id, '_vendor_code', esc_attr( $_vendor_code ) );
}
 
function so_add_custom_field_variation_data( $variations ) {
	$variations['_vendor_code'] = '<div class="woocommerce_vendor_code">Vendor Code: <span>' . get_post_meta( $variations[ 'variation_id' ], '_vendor_code', true ) . '</span></div>';
	return $variations;
}


function hpy_tp_get_next_number() {

	global $wpdb;

	$SQL = "SELECT MAX( pm.meta_value ) AS 'ID' FROM $wpdb->postmeta AS pm WHERE pm.meta_key LIKE '_tp_unique_identifier' AND pm.meta_value LIKE 'HPYITB%'";
	$result = array_shift( $wpdb->get_results( $SQL, ARRAY_A ) );

	$id = str_replace( 'HPYITB', '', $result['ID'] );

	/*
	$that = new Hpy_Product_Link_Admin( 'hpy-product-link', '1.0.0' );
	$remote_upsell = json_decode( $that->hpy_wp_rest( 'hpy_product_link/v1/get_linked_identifier', 'GET', $id ) );

	if ( $remote_upsell->id ) {
		$remote_id = str_replace( 'HPYITB', '', $remote_upsell->id );

		if ( $remote_id > $id ) {
			$id = $remote_id;
		}
	}
	*/

	$id++;
	$id = str_pad($id,4,"0",STR_PAD_LEFT);
	$return = 'HPYITB' . $id;

	return $return;

}

add_action( 'save_post', 'hpy_itb_tp_unique_identifier_on_save', 1, 2 );
function hpy_itb_tp_unique_identifier_on_save( $post_id, $post, $type = '' ) {
	$post_type = get_post_type( $post_id );

	if ( 'product' != $post_type ) {
		return;
	}

	if ( empty( $_POST ) ) {
		return;
	}

	if (isset($post->post_status) && 'auto-draft' == $post->post_status) {
		return;
	}

	if ( $_POST['action'] == 'heartbeat' ) {
		return;
	}

	if ( !empty( get_post_meta( $post_id, '_tp_unique_identifier', true ) ) ) {
		return;
	}


	if( ( wp_is_post_revision( $post_id) || wp_is_post_autosave( $post_id ) ) ) {
		return;
	}

	$identifier = hpy_tp_get_next_number();

	if (!empty($identifier)) {
		update_post_meta($post_id, '_tp_unique_identifier', $identifier);
	}

}

add_action( 'admin_menu', 'hpy_itb_get_linked_override_menu' );
function hpy_itb_get_linked_override_menu() {
//	add_submenu_page( 'tools.php', 'Category Overrides', 'Category Overrides', 'manage_options', 'category_overrides', 'hpy_itb_get_linked_override' );
//	add_submenu_page( 'tools.php', 'Attribute Overrides', 'Attribute Overrides', 'manage_options', 'product_overrides', 'hpy_itb_get_linked_attributes' );
}

function hpy_itb_get_linked_attributes() {

	global $wpdb;
	$prod_data = array();

	$prod_args = array(
		'limit' => -1,
		'type' => array( 'simple', 'variable' )
	);

	$products = wc_get_products( $prod_args );
	$that = new Hpy_Product_Link_Admin('hpy-product-link', '1.0.0');

	foreach( $products as $product ) {

		$linked = json_decode( get_post_meta( $product->id, '_product_link', true ) );
		if ( !empty( $linked->id ) ) {
			$term_metas = json_decode($that->hpy_wp_rest('hpy_product_link/v1/get_product_attributes', 'POST', array( 'ID' => $linked->id ) ));
			foreach( $term_metas->terms AS $key => $value ) {
				$values = array();
				if ( $key != 'pa_year-choice' ) {
					$key = str_replace( '-', '_', $key );
				}
				$exists = hpy_wc_taxonomy_exists($key);

				foreach( $value as $terms ) {
					$values[] = array( 'name' => $terms->name, 'slug' => $terms->slug );
				}

				if ( !$exists ) {
					$attribute = array();
					$name = str_replace( 'pa_', '', $key );
					$label = ucwords( str_replace( 'pa_', '', $key ) );

					$attribute['attribute_name'] = $name;
					$attribute['attribute_label'] = $label;
					$created = process_add_attribute( $attribute );

					if ( $created ) {
						$prod_data = array_merge( $prod_data, hpy_itb_add_product_attributes( $key, $values, $product->id, $prod_data ) );
					}
				} else {
					$prod_data = array_merge( $prod_data, hpy_itb_add_product_attributes( $key, $values, $product->id, $prod_data ) );
				}
			}
			$current_data = array(); //get_post_meta( $product->id, '_product_attributes', true ) ? get_post_meta( $product->id, '_product_attributes', true ) : array();
			$new_data = array_merge( $current_data, $prod_data );
			//Update the parent post with the new attribute list.
			update_post_meta($product->id, '_product_attributes', $new_data);

			//This can be update if a default attribute field is set.
			update_post_meta($product->id, '_default_attributes', array());
		}
	}
}

function hpy_itb_add_product_attributes( $attribute_key, $attributes, $post_id, $prod_data, $variation = false ) {
	//Create the new attributes for the Product
	$variations_key = $attribute_key;

	//Go through each new Attribute and create the correct Attribute Object
	foreach( $attributes as $attribute ) {
		$var_keys[] = sanitize_title( $attribute['name'] );
		wp_insert_term( $attribute['name'],
			$variations_key,
			array(
				'slug' => sanitize_title( $attribute['slug'] )
			)
		);
	}

	//Make sure the attribute object is assigned to the post with the required fields.
	wp_set_object_terms( $post_id, $var_keys, $variations_key, true );

	//Build out an array with all the new values
	$prod_data = array(
		$variations_key => array(
			'name' => $variations_key,
			'value' => implode(' | ', $var_keys),
			'is_visible' => '0',
			'is_variation' => $variation ? '1' : '0',
			'is_taxonomy' => '1'
		)
	);

	return $prod_data;
}

function hpy_itb_get_linked_override() {

	global $wpdb, $wp_registered_widgets;

	$taxonomy     = 'product_cat';
	$orderby      = 'name';
	$show_count   = 0;      // 1 for yes, 0 for no
	$pad_counts   = 0;      // 1 for yes, 0 for no
	$hierarchical = 1;      // 1 for yes, 0 for no
	$empty        = 0;

	$args = array(
		'taxonomy'     => $taxonomy,
		'orderby'      => $orderby,
		'show_count'   => $show_count,
		'pad_counts'   => $pad_counts,
		'hierarchical' => $hierarchical,
		'hide_empty'   => $empty
	);

	$all_categories = get_categories( $args );
	$sidebars_widgets = wp_get_sidebars_widgets()['itb-sidebar'];

	$that = new Hpy_Product_Link_Admin( 'hpy-product-link', '1.0.0' );
	$term_metas = json_decode( $that->hpy_wp_rest('hpy_product_link/v1/get_category_attributes', 'GET', '') );

	foreach( $all_categories as $category ) {
		$linked = json_decode( get_term_meta( $category->term_id, '_product_link', true ) );
		if ( !empty( $linked->id ) ) {
			$id = $linked->id;
			$override = $term_metas->terms->$id;
			if ($override) {
				if ( is_string( $override ) ) {
					$override = unserialize($override);
				}

				$hpy_layer_nav = get_option( 'widget_hpy_layered_nav' );

				foreach( $override as $key => $value ) {
					if ( $key == 'enabled' || $key == 'woocommerce_price_filter-2' ) {
						continue;
					}
					$changed = false;

					foreach( $hpy_layer_nav as $l_key => $l_value ) {
						if ( $value['title'] == $l_value['title'] ) {
							$new_key = 'hpy_layered_nav-' . $l_key;
							$override[$new_key]['enabled'] = $override[$key]['enabled'];
							$override[$new_key]['title'] = $value['title'];
							$override[$new_key]['order'] = $value['order'];
							unset( $override[$key] );
							$changed = true;
						}
					}

					if ( !$changed ) {
						unset( $override[$key] );
					}

				}
				$updated = update_term_meta($category->term_id, 'hpy_itb_sidebar_override', $override);
			}
		}
	}
}

add_filter( 'woocommerce_catalog_orderby', 'hpy_itb_woocommerce_catalog_orderby' );
function hpy_itb_woocommerce_catalog_orderby( $orderby ) {

	$orderby = array(
		'menu_order' => __( 'Default sorting', 'woocommerce' ),
		'popularity' => __( 'Popularity', 'woocommerce' ),
		'rating'     => __( 'Average rating', 'woocommerce' ),
		'date'       => __( 'Newness', 'woocommerce' ),
		'price'      => __( 'Price: low to high', 'woocommerce' ),
		'price-desc' => __( 'Price: high to low', 'woocommerce' ),
    );
    
    if( wc_get_loop_prop( 'is_search' ) ){
        $orderby['relevance'] = __('Relevance', 'woocommerce');
    }

	return $orderby;
}

add_action( 'init', 'hpy_itb_remove_canonical_on_endpoints', 999);
function hpy_itb_remove_canonical_on_endpoints() {
	remove_action('wpseo_head', array( 'WPSEO_Frontend', 'canonical' ), 20);
}

add_filter( 'wpseo_canonical', 'hpy_itb_canonical_tweak', 10, 1 );
function hpy_itb_canonical_tweak( $canonical ) {

	global $wp_query;

	$term_id = $wp_query->get_queried_object()->term_id;
	$paged = $wp_query->is_paged();

	$page_object = get_field( 'template_override', 'product_cat_' . $term_id );

	if ( is_product_category() && $paged ) {
		return get_term_link( (int)$term_id, 'product_cat' );
	}

	return $canonical;

}

add_filter( 'wpseo_disable_adjacent_rel_links', 'hpy_itb_remove_product_archive_next_prev' );

function hpy_itb_remove_product_archive_next_prev ( $return ) {

	if ( is_product_category() ) {
		return true;
	}

	return $return;

}

add_action( 'woocommerce_order_actions', 'hpy_itb_woocommerce_order_actions' );
function hpy_itb_woocommerce_order_actions( $actions ) {

	global $theorder;

	if ( $theorder->has_status( 'completed' ) ) {
		return $actions;
	}

	$actions['hpy_itb_update_order_info'] = __( 'Sync order with Access', 'hpy' );
	return $actions;

}

add_action( 'woocommerce_order_action_hpy_itb_update_order_info', 'hpy_itb_manually_update_specific_order' );
function hpy_itb_manually_update_specific_order( $order ) {

	$api_class = new ITB_Contact_Web_Service();
	$order_ref = hpy_get_order_reference( $order );
	$customer_code = hpy_get_customer_code( $order );

	if ( hpy_itb_is_uk_site() ) {
		$order_api_response = $api_class->DespatchedByRefrence( $order_ref, $customer_code );

		if ( !empty( $order_api_response ) ) {
			if ($order_api_response[0]->DespatchStatus == 'DP') {
				$tracking_code = $order_api_response[0]->TrackingNo;
				$courier = $order_api_response[0]->Courier;
				$dispatch_date = $order_api_response[0]->DespatchDate;

				if (!empty($tracking_code)) {
					update_post_meta($order->get_id(), '_hpy_tracking_code', $order_api_response[0]->TrackingNo);
				}

				if (!empty($courier)) {
					update_post_meta($order->get_id(), '_hpy_delivery_method', $order_api_response[0]->Courier);
				}

				if (!empty($dispatch_date)) {
					update_post_meta($order->get_id(), '_hpy_despatch_date', $order_api_response[0]->DespatchDate);
					$order->set_status('completed', 'Order has been dispatched via ' . $courier . ' on ' . date('dS F Y', strtotime($dispatch_date)));
				}

				$order->save();
			}
		}
	} else {
		$order_api_response = $api_class->hpy_itb_access_sig_webservice_api( 'GetOrderDespatchesByReference', $order_ref, $customer_code );

		if ( !empty( $order_api_response ) ) {
			if ( !empty( $order_api_response[0]->DespatchDate ) ) {
				$tracking_code = $order_api_response[0]->TrackingNo;
				$courier = $order_api_response[0]->Courier;
				$dispatch_date = $order_api_response[0]->DespatchDate;

				if (!empty($tracking_code)) {
					update_post_meta($order->get_id(), '_hpy_tracking_code', $order_api_response[0]->TrackingNo);
				}

				if (!empty($courier)) {
					update_post_meta($order->get_id(), '_hpy_delivery_method', $order_api_response[0]->Courier);
				}

				if (!empty($dispatch_date)) {
					update_post_meta($order->get_id(), '_hpy_despatch_date', $order_api_response[0]->DespatchDate);
					$order->set_status('completed', 'Order has been dispatched via ' . $courier . ' on ' . date('dS F Y', strtotime($dispatch_date)));
				}

				$order->save();
			}
		}
	}
}



function hpy_order_pagination( $current_page, $max_pages ){
	if ( $max_pages <= 1 ) {
		return;
	}

	echo '<nav class="woocommerce-pagination">';
		if ( $current_page >= 1 )
			$links[] = $current_page;

		/** Add the pages around the current page to the array */
		if ( $current_page >= 3 ) {
			$links[] = $current_page - 1;
			$links[] = $current_page - 2;
		}

		if ( ( $current_page + 2 ) <= $max_pages ) {
			$links[] = $current_page + 2;
			$links[] = $current_page + 1;
		}

		if ( 1 !== $current_page ) :
			printf( '<a href="%s" class="%s">%s%s</a>' . "\n", esc_url( wc_get_endpoint_url( 'orders', $current_page - 1 ) ), 'prev page-numbers', get_hpy_svg('arrow-left'), __( 'Prev', 'woocommerce' ) );
		endif;

		if ( ! in_array( 1, $links ) ) {

			if( 1 == $current_page ){
				printf('<span aria-current="page" class="%s">%s</span>', 'page-numbers current', 1 );
			}else{
				printf( '<a href="%s" class="%s">%s</a>', esc_url( wc_get_endpoint_url( 'orders', 1 ) ), 'page-numbers', 1 );
			}

			if ( ! in_array( 2, $links ) )
				echo '<span>…</span>';
		}

		sort( $links );
		foreach ( (array) $links as $link ) {
			if( $current_page == $link ){
				printf('<span aria-current="page" class="%s">%s</span>', 'page-numbers current', $link );
			}else{
				printf( '<a href="%s" class="%s">%s</a>', esc_url( wc_get_endpoint_url( 'orders', $link ) ), 'page-numbers', $link );
			}
		}

		if ( ! in_array( $max_pages, $links ) ) {
			if ( ! in_array( $max_pages - 1, $links ) )
				echo '<span>…</span>';


			if( $current_page == $max_page ){
				printf('<span aria-current="page" class="%s">%s</span>', 'page-numbers current', $link );
			}else{
				printf( '<a href="%s" class="%s">%s</a>', esc_url( wc_get_endpoint_url( 'orders', $max_pages ) ), 'page-numbers', $max_pages );
			}
		}

		if ( intval( $max_pages ) !== $current_page ) :
			// <a class="next page-numbers" href="https://itbtestsite.co.uk/en-gb/childrens-character-books/page/2/">Next<svg class="svg-icon icon-arrow-right" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg></a>
			printf( '<a href="%s" class="%s">%s%s</a>' . "\n", esc_url( wc_get_endpoint_url( 'orders', $current_page + 1 ) ), 'next page-numbers', __( 'Next', 'woocommerce' ), get_hpy_svg('arrow-right') );
		endif;

	echo '</nav>';
}

add_filter('woocommerce_my_account_my_orders_query', 'hpy_orders_pagination');
function hpy_orders_pagination( $query ){
	$query['limit'] = 5;
	return $query;
}

add_filter('woocommerce_page_title', 'hpy_shop_page_title');
function hpy_shop_page_title( $page_title ){
    global $post;
    if( ! empty( $_GET['bf_request'] ) && $_GET['bf_request'] == 'prdf' && is_shop() ){
        $loop_total = wc_get_loop_prop('total');
        $page_title = sprintf( _n( 'Result', 'Results', $loop_total, 'hpy' ) );;
    }

    return $page_title;
}

// Search Woocommerce orders including the ITB prefix.
add_filter('posts_clauses', 'hpy_wc_orders_query');
function hpy_wc_orders_query($query){
  global $wpdb;
  if ( is_search() && is_admin() && $_GET['post_type'] == 'shop_order' ) {
    $search_string = like_escape( $_GET['s'] );
    //Remove prefix if it exists
    $prefixes = array(
      '0' =>  'ITBUS',
      '1' =>  'ITBEU',
      '2' =>  'ITBCA',
      '3' =>  'ITB',
    );
    foreach ( $prefixes as $prefix ) {
      if ( substr($search_string, 0, strlen($prefix)) == $prefix && strlen($search_string) !== strlen($prefix) ) {
        $search_string = substr($search_string, strlen($prefix));
        $query['where'] .= " OR $wpdb->posts.ID = $search_string";
        break;
      } elseif ( substr($search_string, 0, strlen(strtolower($prefix))) == strtolower($prefix) && strlen($search_string) !== strlen($prefix) ) {
        $search_string = substr($search_string, strlen($prefix));
        $query['where'] .= " OR $wpdb->posts.ID = $search_string";
        break;
      } elseif ($search_string === $prefix || $search_string === strtolower($prefix)) {
        $query['where'] = " AND $wpdb->posts.post_type = 'shop_order' ";
        break;
      }
    }
  }
  return $query;
}

add_action( 'woocommerce_checkout_update_order_review', 'hpy_checkout_update_customer_name' );
function hpy_checkout_update_customer_name( $data ){
	parse_str( $data, $fields );
	if( ! empty( $fields ) ){
		WC()->customer->set_shipping_first_name( $fields['shipping_first_name'] );
		WC()->customer->set_shipping_last_name( $fields['shipping_last_name'] );
		WC()->customer->set_billing_first_name( $fields['billing_first_name'] );
		WC()->customer->set_billing_last_name( $fields['billing_last_name'] );
		WC()->customer->set_billing_phone( $fields['shipping_phone_number'] );
		WC()->customer->save();
	}
}

add_filter( 'site_transient_update_plugins', 'hpy_remove_update_nag', 10, 2 );
function hpy_remove_update_nag( $value, $transient ) {

	if ( !empty( $value->response['woocommerce-google-analytics-integration/woocommerce-google-analytics-integration.php'] ) ) {
		unset( $value->response['woocommerce-google-analytics-integration/woocommerce-google-analytics-integration.php'] );
	}

	return $value;

}

remove_action( 'wp_footer', 'woocommerce_demo_store' );
add_filter( 'woocommerce_demo_store', 'hpy_store_notice', 10, 2 );
function hpy_store_notice( $markup, $notice ){
	$svg = get_hpy_svg('cross-icon');
	return "<div class='woocommerce-store-notice demo_store'><div class='container'><div class='woocommerce-store-notice-inner'><span>$notice</span><a href='#' class='woocommerce-store-notice__dismiss-link'>$svg Close</a></div></div></div>";
}

add_filter( 'woocommerce_my_account_my_orders_query', 'hpy_woocommerce_my_account_my_orders_query', 99 );
function hpy_woocommerce_my_account_my_orders_query( $query ) {
	
	$order_statuses = array(
		'wc-processing' => _x( 'Processing', 'Order status', 'woocommerce' ),
		'wc-completed'  => _x( 'Completed', 'Order status', 'woocommerce' ),
		'wc-refunded'   => _x( 'Refunded', 'Order status', 'woocommerce' ),
	);
	
	$query['post_status'] = array_keys( $order_statuses );
	
	return $query;
	
}


add_filter( 'woocommerce_order_item_name', 'change_orders_items_names', 10, 2 );
function change_orders_items_names( $item_name, $item ) {
	if($item->get_product_id()==57084){
		$pers = wc_get_order_item_meta( $item->get_id(), 'hpy_personalisation_data' );
		if(!empty($pers['giftpack']['name'])){
			$item_name = "Original Newspaper - " . $pers['giftpack']['name'];
		}
	}
    return $item_name;
}


// return shipping estimates
add_action('wp_ajax_update_shipping_estimates', 'update_shipping_estimates');
add_action('wp_ajax_nopriv_shipping_estimates', 'update_shipping_estimates');
function update_shipping_estimates() {
	
	$available_methods = WC()->session->get('shipping_for_package_0')['rates'];
	$chosen_method = WC()->session->get('chosen_shipping_methods')[0];
	
	ob_start();
	
	if (1 < count($available_methods)) {
		
		get_shipping_methods_output($available_methods, $index, $chosen_method, false);
		
	} elseif (1 === count( $available_methods)) {
		
		get_shipping_methods_output( $available_methods, $index, $chosen_method, true );
		
	} elseif (WC()->customer->has_calculated_shipping()) {
		
		echo apply_filters('woocommerce_cart_no_shipping_available_html', wpautop(__('There are no shipping methods available. Please ensure that your address has been entered correctly, or contact us if you need any help.', 'woocommerce')));
		
	}
	
	$output = ob_get_clean();
	
	// the function uses is_cart() but that gives the wrong result in this instance
	echo str_replace('checkout-radio-button-group', 'radio-button-group', $output);
	
	exit;
}

// used to set various cookies used for split testing
add_action('init', 'split_test_cookies');
function split_test_cookies() {
	$expiry = strtotime('+30 days');
	
	// set cookie for message ideas
	if (isset($_GET['_msg_ideas'])) {
		setcookie('split_test_messageideas', 1, $expiry, COOKIEPATH, COOKIE_DOMAIN);
	}
	
	// set cookie for category 2 column layout
	if (isset($_GET['_category_2_column'])) {
		setcookie('split_test_category_2_column', 1, $expiry, COOKIEPATH, COOKIE_DOMAIN);
	}
	
	// set cookie for navigating directly to the basket
	if (isset($_GET['_direct_basket'])) {
		setcookie('split_test_direct_basket', 1, $expiry, COOKIEPATH, COOKIE_DOMAIN);
	}
	
	// set cookie for gift pack display variations
	$content = array_keys($_GET);
	$found = false;
	foreach ($content as $i => $key) {
		if (strstr($key, '_gift_pack_variation_')) {
			$arrContent = explode('_gift_pack_variation_', $key);
			$found = true;
			break;
		}
	}
	$gift_pack_split = get_field('enabled_gift_pack_split_tests', 'option');
	if ($gift_pack_split == true && $found) {
		$getParameter = $arrContent[1];
		$gift_pack_variations = get_field('gift_pack_variations', 'option');
		foreach ($gift_pack_variations as $key => $gift_pack) {
			$giftKey = $key+1;
			if ($arrContent[1] == $giftKey) {
				setcookie('gift_pack_per_page', $gift_pack['number_to_show'], $expiry, COOKIEPATH, COOKIE_DOMAIN);
				setcookie('gift_order_by', $gift_pack['gift_order_by'], $expiry, COOKIEPATH, COOKIE_DOMAIN);
				if ($gift_pack['show_load_more_button'] == 1) {
					setcookie('gift_pack_load_more', 1, $expiry, COOKIEPATH, COOKIE_DOMAIN);
				} else {
					setcookie('gift_pack_load_more', 0, $expiry, COOKIEPATH, COOKIE_DOMAIN);
				}
			}
		}
	}

	// set cookie for ONJ book offer variations
	$content = array_keys($_GET);
	$book_offer_variation_found = false;
	foreach ($content as $i => $key) {
		if (strstr($key, '_onj_book_offer_variation_')) {
			$arrProductContent = explode('_onj_book_offer_variation_', $key);
			$book_offer_variation_found = true;
			break;
		}
	}
	if ($book_offer_variation_found) {
		$product_pack_variations = get_field('book_offer_variations', 'option');
		foreach ($product_pack_variations as $key => $product_pack) {
			$productKey = $key+1;
			if ($arrProductContent[1] == $productKey) {
				setcookie('book_offer_variation_number', $productKey, $expiry, COOKIEPATH, COOKIE_DOMAIN);
			}
		}
	}
	//Set newspaper title order
	$newsPaperOrderId = null;
	foreach ($content as $i => $key) {
		if (strstr($key, '_newspaper_title_order_')) {
			$newsPaperOrder = explode('_newspaper_title_order_', $key);
			$newsPaperOrderId = (isset($newsPaperOrder[1])) ? $newsPaperOrder[1] : null;
			break;
		}
	}
	if ($newsPaperOrderId) {
		setcookie('newspaper_title_order', $newsPaperOrderId, $expiry, COOKIEPATH, COOKIE_DOMAIN);
    }
    
    //split test for CTA text on homepage and other newspaper landing pages
	$isNewspaperDateCTA = null;
	foreach ( $content as $i => $key ) {
		if ( strstr( $key, '_newspaper_date_cta_' ) ) {
			$isNewspaperDateCTASplit = explode( '_newspaper_date_cta_', $key );
			$isNewspaperDateCTA      = ( isset( $isNewspaperDateCTASplit[1] ) ) ? $isNewspaperDateCTASplit[1] : null;
			break;
		}
	}
	if ( $isNewspaperDateCTA == 1 ) {
		setcookie( 'newspaper_date_cta_homepage', $isNewspaperDateCTA, $expiry, COOKIEPATH, COOKIE_DOMAIN );
	} elseif ( $isNewspaperDateCTA == 2 ) {
		setcookie( 'newspaper_date_cta_others', $isNewspaperDateCTA, $expiry, COOKIEPATH, COOKIE_DOMAIN );
	}

}
// Klarna OSM changes
function change_klarna_onsite_messaging_product_target($location) {
	$location = 'woocommerce_single_product_summary';
	return $location;
}
add_filter('klarna_onsite_messaging_product_target', 'change_klarna_onsite_messaging_product_target');

function change_klarna_onsite_messaging_product_priority($priority) {
	$priority = '19';
	return $priority;
}
add_filter('klarna_onsite_messaging_product_priority', 'change_klarna_onsite_messaging_product_priority');

function change_klarna_onsite_messaging_car_target($location) {
	$location = 'itb_cart_header_topstrip';
	return $location;
}
add_filter('klarna_onsite_messaging_cart_target', 'change_klarna_onsite_messaging_car_target');

function change_klarna_onsite_messaging_cart_priority($priority) {
	$priority = '1';
	return $priority;
}
add_filter('klarna_onsite_messaging_cart_priority', 'change_klarna_onsite_messaging_cart_priority');

//change woocommerce currency based on site code
function hn_custom_currency_symbol($symbol, $currency) {
    if (isset($_ENV["SITE_CODE"]) && $_ENV["SITE_CODE"] == "us") {
        return '$';
    }
    return "&pound;";
}
add_filter('woocommerce_currency_symbol', 'hn_custom_currency_symbol', 10, 2);

function quantity_wp_head() {
	if ( is_product() ) {
	?>
	<style type="text/css">.quantity, .buttons_added { width:0; height:0; display: none; visibility: hidden; }</style>
	<?php }
}
add_action( 'wp_head', 'quantity_wp_head' );

/**
 * Exclude variable product prices from the price filter
 * 
 * @param $sql
 * @param $meta_query_sql
 * @param $tax_query_sql
 *
 * @return string
 */
function hn_woocommerce_price_filter_sql($sql, $meta_query_sql, $tax_query_sql) {
	global $wpdb;
	$exclude_variable_products_qry ="AND {$wpdb->posts}.ID NOT IN ( 
SELECT
    posts.ID
FROM
    {$wpdb->posts} AS posts
LEFT JOIN {$wpdb->prefix}term_relationships AS term_relationships ON posts.ID = term_relationships.object_id
LEFT JOIN {$wpdb->prefix}term_taxonomy AS term_taxonomy ON term_relationships.term_taxonomy_id = term_taxonomy.term_taxonomy_id
LEFT JOIN {$wpdb->prefix}terms AS terms ON term_taxonomy.term_id = terms.term_id
WHERE
    term_taxonomy.taxonomy = 'product_type'
AND terms.slug = 'variable')";
	return substr_replace( $sql, $exclude_variable_products_qry, (strlen($sql) - 1), 0 );
}
add_filter('woocommerce_price_filter_sql', 'hn_woocommerce_price_filter_sql', 10, 3);