# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
# rubocop:disable Style/WordArray

# Store configuration for label printing and designing.
class ConfigEngine # rubocop:disable Metrics/ClassLength
  BASE_CONFIG = {
    'CMS' => {
      'Custom Variable' => { group: 'Custom', resolver: 'NONE', applications: ['CMS'] },
      'Commodity' => { group: 'Commodity', resolver: 'rmt_commodity_code', applications: ['CMS'] },
      'Commodity Short Description' => { group: 'Commodity', resolver: 'print_value_rmt_commodity, desc_short', applications: ['CMS'] },
      'Commodity Medium Description' => { group: 'Commodity', resolver: 'print_value_rmt_commodity, desc_medium', applications: ['CMS'] },
      'Commodity Long Description' => { group: 'Commodity', resolver: 'print_value_rmt_commodity, desc_long', applications: ['CMS'] },
      'Commodity TM Description' => { group: 'Commodity', resolver: 'print_value_tm_rmt_commodity, description', applications: ['CMS'] },
      'Variety' => { group: 'Variety', resolver: 'rmt_variety_code', applications: ['CMS'] },
      'Variety Short Description' => { group: 'Variety', resolver: 'print_value_rmt_variety, desc_short', applications: ['CMS'] },
      'Variety Medium Description' => { group: 'Variety', resolver: 'print_value_rmt_variety, desc_medium', applications: ['CMS'] },
      'Variety Long Description' => { group: 'Variety', resolver: 'print_value_rmt_variety, desc_long', applications: ['CMS'] },
      'Variety TM Description' => { group: 'Variety', resolver: 'print_value_tm_rmt_variety, description', applications: ['CMS'] },
      'Variety barcode' => { group: 'Variety barcode', resolver: 'variety_barcode', applications: ['CMS'] },
      'Variety barcode Short Description' => { group: 'Variety barcode', resolver: 'print_value_fg_variety_barcode, desc_short', applications: ['CMS'] },
      'Variety barcode Medium Description' => { group: 'Variety barcode', resolver: 'print_value_fg_variety_barcode, desc_medium', applications: ['CMS'] },
      'Variety barcode Long Description' => { group: 'Variety barcode', resolver: 'print_value_fg_variety_barcode, desc_long', applications: ['CMS'] },
      'Pack' => { group: 'Pack', resolver: 'rmt_pack_code', applications: ['CMS'] },
      'Pack Short Description' => { group: 'Pack', resolver: 'print_value_rmt_pack, desc_short', applications: ['CMS'] },
      'Pack Medium Description' => { group: 'Pack', resolver: 'print_value_rmt_pack, desc_medium', applications: ['CMS'] },
      'Pack Long Description' => { group: 'Pack', resolver: 'print_value_rmt_pack, desc_long', applications: ['CMS'] },
      'Size Count' => { group: 'Size Count', resolver: 'rmt_size_count_code', applications: ['CMS'] },
      'Print Count' => { group: 'Size Count', resolver: 'print_count', applications: ['CMS'] },
      'Size Count Short Description' => { group: 'Size Count', resolver: 'print_value_rmt_size_count, desc_short', applications: ['CMS'] },
      'Size Count Medium Description' => { group: 'Size Count', resolver: 'print_value_rmt_size_count, desc_medium', applications: ['CMS'] },
      'Size Count Long Description' => { group: 'Size Count', resolver: 'print_value_rmt_size_count, desc_long', applications: ['CMS'] },
      'Mark' => { group: 'Mark', resolver: 'fg_mark_code', applications: ['CMS'] },
      'Mark Short Description' => { group: 'Mark', resolver: 'print_value_fg_mark, desc_short', applications: ['CMS'] },
      'Mark Medium Description' => { group: 'Mark', resolver: 'print_value_fg_mark, desc_medium', applications: ['CMS'] },
      'Mark Long Description' => { group: 'Mark', resolver: 'print_value_fg_mark, desc_long', applications: ['CMS'] },
      'Grade' => { group: 'Grade', resolver: 'fg_grade_code', applications: ['CMS'] },
      'Grade Short Description' => { group: 'Grade', resolver: 'print_value_fg_grade, desc_short', applications: ['CMS'] },
      'Grade Medium Description' => { group: 'Grade', resolver: 'print_value_fg_grade, desc_medium', applications: ['CMS'] },
      'Grade Long Description' => { group: 'Grade', resolver: 'print_value_fg_grade, desc_long', applications: ['CMS'] },
      'Shift' => { group: 'Shift', resolver: 'print_value_is_shift, code', applications: ['CMS'] },
      'Pool' => { group: 'Pool', resolver: 'finance_pool_code', applications: ['CMS'] },
      'Pool Short Description' => { group: 'Pool', resolver: 'print_value_finance_pool, desc_short', applications: ['CMS'] },
      'Pool Medium Description' => { group: 'Pool', resolver: 'print_value_finance_pool, desc_medium', applications: ['CMS'] },
      'Pool Long Description' => { group: 'Pool', resolver: 'print_value_finance_pool, desc_long', applications: ['CMS'] },
      'Packhouse ID' => { group: 'Packhouse', resolver: 'print_value_mes_facility, code', applications: ['CMS'] },
      'Packhouse Number' => { group: 'Packhouse', resolver: 'print_value_mes_facility, packhouse_number', applications: ['CMS'] },
      'PHC' => { group: 'Packhouse', resolver: 'print_value_mes_facility, puc_phc', applications: ['CMS'] },
      'PHC Description' => { group: 'Packhouse', resolver: 'print_value_mes_facility, desc_short', applications: ['CMS'] },
      'PUC' => { group: 'PUC', resolver: 'cs_puc_code', applications: ['CMS'] },
      'PUC Short Description' => { group: 'PUC', resolver: 'print_value_cs_puc, desc_short', applications: ['CMS'] },
      'PUC Medium Description' => { group: 'PUC', resolver: 'print_value_cs_puc, desc_medium', applications: ['CMS'] },
      'PUC Long Description' => { group: 'PUC', resolver: 'print_value_cs_puc, desc_long', applications: ['CMS'] },
      'Orchard' => { group: 'PUC', resolver: 'orchard_code', applications: ['CMS'] },
      'Grower ID' => { group: 'Grower ID', resolver: 'print_value_grower, is_party_code', applications: ['CMS'] },
      'Organization' => { group: 'Organization', resolver: 'print_value_organization, is_party_code', applications: ['CMS'] },
      'GLN' => { group: 'Organization', resolver: 'print_value_is_organization, gln', applications: ['CMS'] },
      'Organization Short Description' => { group: 'Organization', resolver: 'print_value_is_organization, desc_short', applications: ['CMS'] },
      'Organization Medium Description' => { group: 'Organization', resolver: 'print_value_is_organization, desc_medium', applications: ['CMS'] },
      'Organization Long Description' => { group: 'Organization', resolver: 'print_value_is_organization, desc_long', applications: ['CMS'] },
      'Organization Short Address' => { group: 'Organization', resolver: 'print_value_is_organization_address, desc_short', applications: ['CMS'] },
      'Organization Medium Address' => { group: 'Organization', resolver: 'print_value_is_organization_address, desc_medium', applications: ['CMS'] },
      'Organization Long Address' => { group: 'Organization', resolver: 'print_value_is_organization_address, desc_long', applications: ['CMS'] },
      'PHC text' => { group: 'Static', resolver: 'print_value_static, PHC:', applications: ['CMS'] },
      'PUC text' => { group: 'Static', resolver: 'print_value_static, PUC:', applications: ['CMS'] },
      'Count text' => { group: 'Static', resolver: 'print_value_static, Count:', applications: ['CMS'] },
      'Period (.)' => { group: 'Static', resolver: 'print_value_static, .', applications: ['CMS'] },
      'Container ID' => { group: 'Container', resolver: 'print_value_static, (99)', applications: ['CMS'] },
      'Decrypted Container ID' => { group: 'Container', resolver: 'print_value_static, (93)', applications: ['CMS'] },
      'Industry number' => { group: 'Industry number', resolver: 'print_value_static, (98)', applications: ['CMS'] },
      'System date' => { group: 'System', resolver: 'print_value_static, (92)', applications: ['CMS'] },
      'System time' => { group: 'System', resolver: 'print_value_static, (97)', applications: ['CMS'] },
      'Personnel Name' => { group: 'Personnel', resolver: 'print_value_static, (96)', applications: ['CMS'] },
      'Personnel Surname' => { group: 'Personnel', resolver: 'print_value_static, (95)', applications: ['CMS'] },
      'Barcode and packline' => { group: 'Barcodes', resolver: 'print_value_barcode_packline', applications: ['CMS'] },
      'Robot Name' => { group: 'Robot', resolver: 'print_value_robot_name', applications: ['CMS'] },
      'Run number' => { group: 'Run number', resolver: 'print_value_run_number', applications: ['CMS'] },
      'Date Code' => { group: 'Date Code', resolver: 'print_value_date_code', applications: ['CMS'] },
      'Picking Reference' => { group: 'Picking Reference', resolver: 'print_value_picking_reference', applications: ['CMS'] },
      'Country' => { group: 'Country', resolver: 'print_value_cms_global_setup, is_country_code', applications: ['CMS'] },
      'OGLLotNr' => { group: 'OGLLotNr', resolver: 'print_value_cms_global_setup, fg_lot_number_code', applications: ['CMS'] },
      'Eurep Gap' => { group: 'Eurep Gap', resolver: 'eurepgap_code', applications: ['CMS'] },
      'Eurep Gap Short Description' => { group: 'Eurep Gap', resolver: 'print_value_standard_code, EGN, desc_short', applications: ['CMS'] },
      'Global Gap' => { group: 'Global Gap', resolver: 'globalgap_code', applications: ['CMS'] },
      'Global Gap Short Description' => { group: 'Global Gap', resolver: 'print_value_standard_code, GGN, desc_short', applications: ['CMS'] },
      'Producer Group Global Gap' => { group: 'Global Gap', resolver: 'print_value_mes_facility, producer_group_global_gap_number', applications: ['CMS'] },
      'Natures Choice' => { group: 'Natures Choice', resolver: 'natureschoice_code', applications: ['CMS'] },
      'Natures Choice Short Description' => { group: 'Natures Choice', resolver: 'print_value_standard_code, NCN, desc_short', applications: ['CMS'] },
      'Gtin Batch or Variety Barcode - (01)gtin(10)batch' => { group: 'Gtin', resolver: 'print_gtin_batch_or_variety_barcode', applications: ['CMS'] },
      'Gtin or Variety Barcode' => { group: 'Gtin', resolver: 'print_gtin_or_variety_barcode', applications: ['CMS'] },
      'Inventory Code' => { group: 'Inventory Code', resolver: 'rmt_inventory_code', applications: ['CMS'] },
      'Remark 1' => { group: 'Remarks', resolver: 'rmt_remark_1', applications: ['CMS'] },
      'Remark 2' => { group: 'Remarks', resolver: 'rmt_remark_2', applications: ['CMS'] },
      'Remark 3' => { group: 'Remarks', resolver: 'rmt_remark_3', applications: ['CMS'] },
      'Dim. Remark' => { group: 'Remarks', resolver: 'dimension_remark', applications: ['CMS'] },
      'Inventory Remark' => { group: 'Remarks', resolver: 'inventory_remark', applications: ['CMS'] },
      'Inventory Code Short Description' => { group: 'Inventory Code', resolver: 'print_value_rmt_inventory, desc_short', applications: ['CMS'] },
      'Grade Sign@' => { group: 'Grade Sign', resolver: 'grade_sign', applications: ['CMS'] },
      'Instruction' => { group: 'Instruction', resolver: 'instruction_code', applications: ['CMS'] },
      'Order Number' => { group: 'Order Number', resolver: 'order_no', applications: ['CMS'] },
      'Sell By Code' => { group: 'Sell By Code', resolver: 'sell_by_code', applications: ['CMS'] },
      'Target Market' => { group: 'Target Market', resolver: 'target_market_code', applications: ['CMS'] },
      'Target Market Short Description' => { group: 'Target Market', resolver: 'print_value_target_market, desc_short', applications: ['CMS'] },
      'Target Market Medium Description' => { group: 'Target Market', resolver: 'print_value_target_market, desc_medium', applications: ['CMS'] },
      'Target Market Long Description' => { group: 'Target Market', resolver: 'print_value_target_market, desc_long', applications: ['CMS'] },
      'Voice Code Large digits' => { group: 'Voice Code', resolver: 'print_value_voice_code, large', applications: ['CMS'] },
      'Voice Code Small digits' => { group: 'Voice Code', resolver: 'print_value_voice_code, small', applications: ['CMS'] },
      'PLU' => { group: 'PLU', resolver: 'plu', applications: ['CMS'] },
      'Season' => { group: 'Bin', resolver: 'season', applications: ['CMS'] },
      'Delivery Variety' => { :group => 'Bin', :resolver => 'delivery_variety', applications: ['CMS'] },
      'Stock Variety' => { :group => 'Bin', :resolver => 'stock_variety', applications: ['CMS'] },
      'Bin Brand' => { group: 'Bin', resolver: 'bin_brand', applications: ['CMS'] },
      'Bin Type' => { group: 'Bin', resolver: 'bin_type', applications: ['CMS'] },
      'Term' => { group: 'Bin', resolver: 'term', applications: ['CMS'] },
      'Pick Code' => { group: 'Bin', resolver: 'print_pick_code', applications: ['CMS'] }
    },
    'Pack Material' => {
      'Location Barcode' => { group: 'Location', resolver: 'BCD:location', applications: ['Location', 'Stock Adjustment'] },
      'Location Long Code' => { group: 'Location', resolver: 'location_long_code', applications: ['Location', 'Stock Adjustment'] },
      'Location Short Code' => { group: 'Location', resolver: 'location_short_code', applications: ['Location', 'Stock Adjustment'] },
      'Location Print Code' => { group: 'Location', resolver: 'print_code', applications: ['Location', 'Stock Adjustment'] },
      'Location Description' => { group: 'Location', resolver: 'location_description', applications: ['Location', 'Stock Adjustment'] },
      'SKU Barcode' => { group: 'SKU', resolver: 'BCD:sku', applications: ['Material Resource SKU Barcode', 'Stock Adjustment'] },
      'SKU Number' => { group: 'SKU', resolver: 'sku_number', applications: ['Material Resource SKU Barcode', 'Stock Adjustment'] },
      'Product Variant Code' => { group: 'Product', resolver: 'product_variant_code', applications: ['Material Resource SKU Barcode', 'Stock Adjustment'] },
      'Product Variant Number' => { group: 'Product', resolver: 'product_variant_number', applications: ['Material Resource SKU Barcode', 'Stock Adjustment'] },
      'Current Date' => { group: 'Time', resolver: 'FNC:current_date', applications: ['Material Resource SKU Barcode', 'Stock Adjustment'] },
      'Current Time' => { group: 'Time', resolver: 'FNC:current_time', applications: ['Material Resource SKU Barcode', 'Stock Adjustment'] },
      'Batch Number' => { group: 'Delivery', resolver: 'batch_number', applications: ['Material Resource SKU Barcode'] },
      'Delivery Number' => { group: 'Delivery', resolver: 'delivery_number', applications: ['Material Resource SKU Barcode'] },
      'Delivery Barcode' => { group: 'Delivery', resolver: 'BCD:delivery', applications: ['Material Resource SKU Barcode'] },
      'Stock Adjustment Number' => { group: 'Stock Adjustment', resolver: 'BCD:stock_adjustment', applications: ['Stock Adjustment'] }
    },
    # --------------------------------------------------------------------------
    'NS Packhouse' => {
      'Location Barcode' => { group: 'Location', resolver: 'BCD:location', applications: ['Location'] },
      'Location Long Code' => { group: 'Location', resolver: 'location_long_code', applications: ['Location'] },
      'Location Short Code' => { group: 'Location', resolver: 'location_short_code', applications: ['Location'] },
      'Location Print Code' => { group: 'Location', resolver: 'print_code', applications: ['Location'] },
      'Location Description' => { group: 'Location', resolver: 'location_description', applications: ['Location'] },
      'Pack point (Drop station)' => { group: 'Pack point', resolver: 'plant_resource_code', applications: ['Packpoint'] },
      'Basic Pack' => { group: 'Carton', resolver: 'basic_pack_code', applications: ['Carton', 'Pallet'] },
      'Carton Number' => { group: 'Carton', resolver: 'carton_label_id', applications: ['Carton'] },
      'Pallet Number' => { group: 'Carton', resolver: 'pallet_number', applications: ['Carton', 'Pallet'] },
      'Pallet Sequences' => { group: 'Pallet', resolver: 'FNC:sequence_table,pallet_id', applications: ['Pallet'] },
      'Carton Quantity' => { group: 'Pallet', resolver: 'carton_quantity', applications: ['Pallet'] },
      'Cartons Per Pallet' => { group: 'Carton', resolver: 'cartons_per_pallet', applications: ['Carton'] },
      'Label Name' => { group: 'Carton', resolver: 'label_name', applications: ['Carton'] },
      'Pack Nett Weight' => { group: 'Carton', resolver: 'pack_nett_weight', applications: ['Carton', 'Pallet'] },
      'Standard Pack' => { group: 'Carton', resolver: 'standard_pack_code', applications: ['Carton', 'Pallet'] },
      'Standard Pack Label Code' => { group: 'Carton', resolver: 'std_pack_label_code', applications: ['Carton', 'Pallet'] },
      'Template' => { group: 'Carton', resolver: 'template_name', applications: ['Carton'] },
      'Farm' => { group: 'Farm', resolver: 'farm_code', applications: ['Carton', 'Pallet'] },
      'Farm Group' => { group: 'Farm', resolver: 'farm_group_code', applications: ['Carton', 'Pallet'] },
      'Orchard' => { group: 'Farm', resolver: 'orchard_code', applications: ['Bin', 'Carton', 'Pallet'] },
      'PUC' => { group: 'Farm', resolver: 'puc_code', applications: ['Carton', 'Pallet'] },
      'Actual Count' => { group: 'Fruit', resolver: 'actual_count_for_pack', applications: ['Carton', 'Pallet'] },
      'Client Product Code' => { group: 'Fruit', resolver: 'client_product_code', applications: ['Carton'] },
      'Client Size Reference' => { group: 'Fruit', resolver: 'client_size_reference', applications: ['Carton'] },
      'Commodity' => { group: 'Fruit', resolver: 'commodity', applications: ['Carton', 'Pallet'] },
      'Commodity Description' => { group: 'Fruit', resolver: 'commodity_description', applications: ['Carton', 'Pallet'] },
      'Cultivar Group' => { group: 'Fruit', resolver: 'cultivar_group_code', applications: ['Carton', 'Pallet'] },
      'Cultivar Group Description' => { group: 'Fruit', resolver: 'cultivar_group_description', applications: ['Carton', 'Pallet'] },
      'Cultivar' => { group: 'Fruit', resolver: 'cultivar_name', applications: ['Bin', 'Carton', 'Pallet'] },
      'Cultivar Description' => { group: 'Fruit', resolver: 'cultivar_description', applications: ['Bin', 'Carton', 'Pallet'] },
      'Customer Variety' => { group: 'Fruit', resolver: 'customer_variety_code', applications: ['Carton', 'Pallet'] },
      'Customer Variety Description' => { group: 'Fruit', resolver: 'customer_variety_description', applications: ['Carton', 'Pallet'] },
      'Customer or Mkt Variety' => { group: 'Fruit', resolver: 'customer_or_marketing_variety', applications: ['Carton', 'Pallet'] },
      'Customer or Mkt Variety Description' => { group: 'Fruit', resolver: 'customer_or_marketing_variety_desc', applications: ['Carton', 'Pallet'] },
      'Grade' => { group: 'Fruit', resolver: 'grade_code', applications: ['Carton', 'Pallet'] },
      'Inventory Code' => { group: 'Fruit', resolver: 'inventory_code', applications: ['Carton', 'Pallet'] },
      'Mark' => { group: 'Fruit', resolver: 'mark_code', applications: ['Carton', 'Pallet'] },
      'Marketing Variety' => { group: 'Fruit', resolver: 'marketing_variety_code', applications: ['Carton', 'Pallet'] },
      'Marketing Variety Description' => { group: 'Fruit', resolver: 'marketing_variety_description', applications: ['Carton', 'Pallet'] },
      'Packed TM' => { group: 'Fruit', resolver: 'packed_tm_group', applications: ['Carton', 'Pallet'] },
      'Specific TM' => { group: 'Fruit', resolver: 'target_market_name', applications: ['Carton', 'Pallet'] },
      'Target customer' => { group: 'Fruit', resolver: 'target_customer', applications: ['Carton', 'Pallet'] },
      'Inspection TM' => { group: 'Fruit', resolver: 'inspection_tm', applications: ['Carton', 'Pallet'] },
      'Product Code' => { group: 'Fruit', resolver: 'product_code', applications: ['Carton'] }, # TODO: Change to fs_product_code...
      'Season' => { group: 'Fruit', resolver: 'season_code', applications: ['Carton', 'Pallet'] },
      'Sell by Code' => { group: 'Fruit', resolver: 'sell_by_code', applications: ['Carton', 'Pallet'] },
      'Count Group' => { group: 'Fruit', resolver: 'size_count_interval_group', applications: ['Carton', 'Pallet'] },
      'Size Count' => { group: 'Fruit', resolver: 'size_count_value', applications: ['Carton', 'Pallet'] },
      'Marketing size range mm' => { group: 'Fruit', resolver: 'marketing_size_range_mm', applications: ['Carton'] },
      'Count Swap Rule' => { group: 'Fruit', resolver: 'count_swap_rule', applications: ['Carton', 'Pallet'] },
      'Size Count UOM' => { group: 'Fruit', resolver: 'size_count_uom', applications: ['Carton', 'Pallet'] },
      'Size Reference' => { group: 'Fruit', resolver: 'size_reference', applications: ['Carton', 'Pallet'] },
      'GGN' => { group: 'Packhouse', resolver: 'gap_code', applications: ['Carton', 'Pallet'] },
      'GLN' => { group: 'Packhouse', resolver: 'gln_code', applications: ['Carton', 'Pallet'] },
      'Line' => { group: 'Packhouse', resolver: 'line', applications: ['Carton', 'Pallet'] },
      'Packhouse' => { group: 'Packhouse', resolver: 'packhouse', applications: ['Carton', 'Pallet'] },
      'PHC' => { group: 'Packhouse', resolver: 'phc', applications: ['Carton', 'Pallet'] },
      'Pick Ref' => { group: 'Packhouse', resolver: 'pick_ref', applications: ['Carton', 'Pallet'] },
      'Production Run ID' => { group: 'Packhouse', resolver: 'production_run_id', applications: ['Carton', 'Pallet'] },
      'Pack Date' => { group: 'Packhouse', resolver: 'pack_date', applications: ['Pallet'] },
      'Pack Week' => { group: 'Packhouse', resolver: 'pack_week', applications: ['Pallet'] },
      'BOM' => { group: 'Pack Materials', resolver: 'bom_code', applications: ['Carton'] },
      'Subtype' => { group: 'Pack Materials', resolver: 'subtype_code', applications: ['Carton'] },
      'Type' => { group: 'Pack Materials', resolver: 'pm_type_code', applications: ['Carton'] },
      'Marketing Org (short)' => { group: 'Marketing', resolver: 'marketing_org_short', applications: ['Pallet'] },
      'Marketing Org (medium)' => { group: 'Marketing', resolver: 'marketing_org_medium', applications: ['Pallet'] },
      'Marketer' => { group: 'Marketing', resolver: 'marketer', applications: ['Carton'] },
      'Marketing Order No' => { group: 'Marketing', resolver: 'marketing_order_number', applications: ['Carton', 'Pallet'] },
      'Product Characteristics' => { group: 'Marketing', resolver: 'product_chars', applications: ['Carton', 'Pallet'] },
      'Treatments' => { group: 'Marketing', resolver: 'treatments', applications: ['Carton', 'Pallet'] },
      'Personnel Number' => { group: 'Personnel', resolver: 'personnel_number', applications: ['Carton', 'Personnel'] },
      'Personnel Name' => { group: 'Personnel', resolver: 'personnel_name', applications: ['Carton', 'Personnel'] },
      'Personnel Identifier (RFID)' => { group: 'Personnel', resolver: 'identifier', applications: ['Carton', 'Personnel'] },
      'Current Date' => { group: 'Time', resolver: 'FNC:current_date', applications: ['Bin', 'Carton', 'Pallet'] },
      'ISO Day' => { group: 'Time', resolver: 'FNC:iso_day', applications: ['Bin', 'Carton', 'Pallet'] },
      'ISO Week' => { group: 'Time', resolver: 'FNC:iso_week', applications: ['Bin', 'Carton', 'Pallet'] },
      'ISO Weekday' => { group: 'Time', resolver: 'FNC:iso_week_day', applications: ['Bin', 'Carton', 'Pallet'] },
      'Bin barcode' => { group: 'Bin', resolver: 'BCD:bin', applications: ['Bin'] },
      'Bin asset number' => { group: 'Bin', resolver: 'bin_asset_number', applications: ['Bin'] },
      'Gross weight' => { group: 'Bin', resolver: 'gross_weight', applications: ['Bin', 'Pallet'] },
      'Nett weight' => { group: 'Bin', resolver: 'nett_weight', applications: ['Bin', 'Pallet'] },
      'UOM' => { group: 'Bin', resolver: 'uom_code', applications: ['Bin'] },
      'Weighed date' => { group: 'Bin', resolver: 'weighed_date', applications: ['Bin'] }
    },
    # --------------------------------------------------------------------------
    'UD Packhouse' => {
      'Account Code' => { group: 'Packhouse variables', resolver: 'account_code', applications: ['Packing'] },
      'Batch Code' => { group: 'Packhouse variables', resolver: 'batch_code', applications: ['Packing'] },
      'Batch Code / Account Code' => { group: 'Packhouse variables', resolver: 'CMP:${batch_code} / ${account_code}', applications: ['Packing'] },
      'Carton Number' => { group: 'Packhouse variables', resolver: 'carton_number', applications: ['Packing'] },
      'Channel' => { group: 'Packhouse variables', resolver: 'channel', applications: ['Packing'] },
      'Commodity Code' => { group: 'Packhouse variables', resolver: 'commodity_code', applications: ['Packing'] },
      'Commodity Description' => { group: 'Packhouse variables', resolver: 'commodity_description', applications: ['Packing'] },
      'Count Size Swap Rule' => { group: 'Packhouse variables', resolver: 'FNC:countSizeSwapRule,commodity_code', applications: ['Packing'] },
      'Created On' => { group: 'Packhouse variables', resolver: 'created_on', applications: ['Packing'] },
      'Current Date' => { group: 'Packhouse variables', resolver: 'current_date', applications: ['Packing'] },
      'EGAP' => { group: 'Packhouse variables', resolver: 'egap', applications: ['Packing'] },
      'Empty' => { group: 'Packhouse variables', resolver: 'empty', applications: ['Packing'] },
      'Farm Code' => { group: 'Packhouse variables', resolver: 'farm_code', applications: ['Packing'] },
      'GAP' => { group: 'Packhouse variables', resolver: 'gap', applications: ['Packing'] },
      'Get Orchard' => { group: 'Packhouse variables', resolver: 'FNC:getOrchard,orchard_code', applications: ['Packing'] },
      'GLN' => { group: 'Packhouse variables', resolver: 'gln', applications: ['Packing'] },
      'Grade Code' => { group: 'Packhouse variables', resolver: 'grade_code', applications: ['Packing'] },
      'GTIN Code' => { group: 'Packhouse variables', resolver: 'gtin_code', applications: ['Packing'] },
      'Inventory Code' => { group: 'Packhouse variables', resolver: 'inventory_code', applications: ['Packing'] },
      'ISO Week' => { group: 'Packhouse variables', resolver: 'iso_week', applications: ['Packing'] },
      'ISO Week / Mark Code' => { group: 'Packhouse variables', resolver: 'CMP:${iso_week} / ${mark_code}', applications: ['Packing'] },
      'Labeling RMT Variety' => { group: 'Packhouse variables', resolver: 'labeling_rmt_variety', applications: ['Packing'] },
      'Mark Code' => { group: 'Packhouse variables', resolver: 'mark_code', applications: ['Packing'] },
      'Orchard Code' => { group: 'Packhouse variables', resolver: 'orchard_code', applications: ['Packing'] },
      'Organization Code' => { group: 'Packhouse variables', resolver: 'organization_code', applications: ['Packing'] },
      'Pack Code' => { group: 'Packhouse variables', resolver: 'pack_code', applications: ['Packing'] },
      'Pack Date Time' => { group: 'Packhouse variables', resolver: 'pack_date_time', applications: ['Packing'] },
      'Packed TM Group Code' => { group: 'Packhouse variables', resolver: 'packed_tm_group_code', applications: ['Packing'] },
      'Packer Barcode' => { group: 'Packhouse variables', resolver: 'packer_barcode', applications: ['Packing'] },
      'Packer Incentivized Employee ID' => { group: 'Packhouse variables', resolver: 'packer_incentivized_employee_id', applications: ['Packing'] },
      'PHC' => { group: 'Packhouse variables', resolver: 'phc', applications: ['Packing'] },
      'Pick Ref' => { group: 'Packhouse variables', resolver: 'pick_reference', applications: ['Packing'] },
      'Product Chars' => { group: 'Packhouse variables', resolver: 'product_chars', applications: ['Packing'] },
      'Production Run ID' => { group: 'Packhouse variables', resolver: 'production_run_id', applications: ['Packing'] },
      'PUC' => { group: 'Packhouse variables', resolver: 'puc', applications: ['Packing'] },
      'Remarks' => { group: 'Packhouse variables', resolver: 'remarks', applications: ['Packing'] },
      'Season' => { group: 'Packhouse variables', resolver: 'season', applications: ['Packing'] },
      'Sell By Code' => { group: 'Packhouse variables', resolver: 'sell_by_code', applications: ['Packing'] },
      'Shift ID' => { group: 'Packhouse variables', resolver: 'shift_id', applications: ['Packing'] },
      'Size Count Code' => { group: 'Packhouse variables', resolver: 'size_count_code', applications: ['Packing'] },
      'Size Ref' => { group: 'Packhouse variables', resolver: 'size_ref', applications: ['Packing'] },
      'Variety Description' => { group: 'Packhouse variables', resolver: 'variety_description', applications: ['Packing'] },
      'Weight' => { group: 'Packhouse variables', resolver: 'weight', applications: ['Packing'] }
    }
  }.freeze

  # Return list of group, key for use in designing.
  def list_names(section)
    BASE_CONFIG[section].map { |key, val| [val[:group], key] }.sort
  end

  # Return a hash keyed by group with array of keys for use in designing.
  def grouped_names(section)
    BASE_CONFIG[section].group_by { |_, v| v[:group] }.each_with_object({}) { |(k, v), hs| hs[k] = v.map(&:first) }
  end

  def list_all_names
    res = {}
    BASE_CONFIG.keys.each do |section|
      res[section] = BASE_CONFIG[section].map { |key, val| [val[:group], key] }.sort
    end
    res
  end

  def config_for(section)
    BASE_CONFIG[section]
  end
end
# rubocop:enable Metrics/LineLength
# rubocop:enable Style/WordArray
