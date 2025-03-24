harness_account_id    = "_Ci0EyZJTDmD1Kc1t_OA_A"
harness_org_id        = "default"
harness_project_id    = "default_project"
harness_api_key       = "aswini-api"
harness_workspace     = "statemigrateworkspace"

source_backend_type   = "s3"  # Change this based on your backend type (e.g., GCS, Azure)
source_bucket_name    = "harness-iacm-bucket"
source_key            = "harness/terraform.tfstate"
source_region         = "us-east-1"

destination_workspace = "statemigrateworkspace"
