library(httr2)
library(jsonlite)

req <- request("https://newsapi.org/v2/everything")|>
  req_url_query(
    q = '`"data science"`',
    from = Sys.Date() - 1,
    pageSize = 10,
    apiKey = Sys.getenv("NEWS_API_KEY")
  )

resp <- req_perform(req)
resp_data <- resp_body_json(resp)

current_date <- as.character(Sys.Date())
json_data <- toJSON(resp_data, pretty = TRUE)
write(json_data, file = glue::glue(current_date, ".json"))

