sns-name = "test-sns-topic-terraform"

secret_names = {
  "project/p1"  = "Description1"
  "project/p2" = "Description2"
}

// ---------------------------------------------------------------------------
// Account & Env Variables
environment                = "dev"
aws_account_number         = "420602990842"
aws_tags_user = {
  Environment : "Development"
}

// ---------------------------------------------------------------------------
// Glue Catalog Variables
glue_db_list = ["demo_db_dev"]

// ---------------------------------------------------------------------------
// Glue Crawler Variables
data_catalog_crawler = "demo_db_dev"
data_source_paths_sharepoint = [
  "sharepoint/",
  "sqi_tracking/SQI_TRACKING_MASTER/"
]

abc_crawlernames = {
  "project-crawler1" = "testing/folder1/"
  "project-crawler2" = "testing/folder2/"
  "project-crawler3" = "testing/folder3/"
  "project-crawler4" = "testing/folder4/"
  "project-crawler5" = "testing/folder5/"
  "project-crawler6" = "testing/folder6/"
  "project-crawler7" = "testing/folder7/"
  "project-crawler8" = "testing/folder8/"
  "project-crawler9" = "testing/folder9/"
}
