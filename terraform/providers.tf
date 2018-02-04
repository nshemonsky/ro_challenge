# set up aws account access credentials
# and regional preference

provider "aws" {
  version = "1.8.0"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
