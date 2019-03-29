# frozen_string_literal: true

# rubocop:disable Metrics/LineLength

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
      'PLU' => { group: 'PLU', resolver: 'plu', applications: ['CMS'] }
    },
    'Pack Material' => {
      'Location Barcode' => { group: 'Locaton', resolver: 'BCD:location', applications: ['Location', 'Stock Adjustment'] },
      'Location Long Code' => { group: 'Locaton', resolver: 'location_long_code', applications: ['Location', 'Stock Adjustment'] },
      'Location Short Code' => { group: 'Locaton', resolver: 'location_short_code', applications: ['Location', 'Stock Adjustment'] },
      'Location Print Code' => { group: 'Locaton', resolver: 'location_print_code', applications: ['Location', 'Stock Adjustment'] },
      'Location Description' => { group: 'Locaton', resolver: 'location_description', applications: ['Location', 'Stock Adjustment'] },
      'SKU Barcode' => { group: 'SKU', resolver: 'BCD:sku', applications: ['Material Resource SKU Barcode', 'Stock Adjustment'] },
      'SKU Number' => { group: 'SKU', resolver: 'sku_number', applications: ['Material Resource SKU Barcode', 'Stock Adjustment'] },
      'Product Variant Code' => { group: 'Product', resolver: 'product_variant_code', applications: ['Material Resource SKU Barcode', 'Stock Adjustment'] },
      'Batch Number' => { group: 'Delivery', resolver: 'batch_number', applications: ['Material Resource SKU Barcode'] },
      'Delivery Number' => { group: 'Delivery', resolver: 'delivery_number', applications: ['Material Resource SKU Barcode'] },
      'Delivery Barcode' => { group: 'Delivery', resolver: 'BCD:delivery', applications: ['Material Resource SKU Barcode'] },
      'Stock Adjustment Number' => { group: 'Stock Adjustment', resolver: 'BCD:stock_adjustment', applications: ['Stock Adjustment'] }
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
