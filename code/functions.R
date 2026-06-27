library(tidyverse)

decode_dataset <- function(df,
                           lookup_list,
                           header_df = NULL,
                           code_col = "code",
                           name_col = "name") {
  
  for(col in names(lookup_list)) {
    
    lookup_df <- lookup_list[[col]]
    
    # Check for duplicate codes in lookup table
    duplicates <- lookup_df %>%
      count(.data[[code_col]]) %>%
      filter(n > 1)
    
    if(nrow(duplicates) > 0) {
      stop(
        paste("Duplicate codes found in lookup table for column", col)
      )
    }
    
    lookup_df[[name_col]] <- as.character(lookup_df[[name_col]])
    
    # Join lookup table with main table
    df <- df %>%
      left_join(
        select(lookup_df, !!sym(code_col), !!sym(name_col)),
        by = setNames(code_col, col)
      ) %>%
      mutate(!!col := coalesce(as.character(!!sym(name_col)), as.character(.data[[col]]))) %>%
      select(-!!sym(name_col))
  }
  
  if(!is.null(header_df)) {
    
    header_lookup <- setNames(header_df[[name_col]], header_df[[code_col]])
    
    names(df) <- ifelse(names(df) %in% names(header_lookup),
                        header_lookup[names(df)],
                        names(df))
  }
  
  df
}
