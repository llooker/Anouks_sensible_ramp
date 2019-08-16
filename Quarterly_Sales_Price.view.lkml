
# If necessary, uncomment the line below to include explore_source.
include: "anouks_sensible_ramp.model.lkml"
view: quarterly_sales_price {
    derived_table: {
      explore_source: order_items {
        column: created_quarter {}
        column: total_sales_price {}
        filters: {
          field: order_items.created_quarter
          value: "20 quarters ago for 20 quarters"
        }
      }
    }
    dimension: created_quarter {
      type: date_quarter
    }
    dimension: total_sales_price {
      value_format: "$#,##0"
      type: number
    }
  }

