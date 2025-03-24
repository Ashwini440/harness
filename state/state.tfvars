account_id = "<harness-account-id>"
org = "<harness-org>"
project = "<harness-project>"
default_provisioner_type = "terraform"
default_provisioner_version = "1.5.7"
default_cost_estimation_enabled = true
default_provider_connector = "<cloud-provider-connector-name>"
default_repository_connector = "<git-repo-connector-name>"
workspaces = [
    {
        identifier = "workspace_demo_1"
        repository = "<repo-directory>"
        repository_path = "migration-demo-1"
        repository_branch = "<repo-branch>"
        terraform_variables = [
            {
                key = "instance_type"
                value = "t2.micro"
                value_type = "string"
            }
        ],
    },
    {
        identifier = "workspace_demo_2"
        repository = "<repo-directory>"
        repository_path = "migration-demo-2"
        repository_branch = "<repo-branch>"
        terraform_variables = [
            {
                key = "instance_type"
                value = "t2.micro"
                value_type = "string"
            }
        ],
    },
]
