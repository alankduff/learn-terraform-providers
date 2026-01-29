provider "aws" {
  region = "us-west-2"

    default_tags {
    tags = {
      Environment = "tutorial"
      Project     = "terraform-configure-providers"
    }
  }
}

resource "aws_s3_bucket" "example" {
  bucket_prefix = "terraform-provider-example-"
}

module "website" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 5.2.0"

  bucket_prefix = "terraform-provider-website-"
 
  tags = {
    Module = "s3-bucket"
  }
}

provider "aws" {
  alias = "east"

  region = "us-east-1"

  default_tags {
    tags = {
      Environment = "tutorial"
      Project     = "terraform-configure-providers"
    }
  }
}

module "website_east" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.2.0"

  providers = {
    aws = aws.east
  }

  bucket_prefix = "example-east-"
}


resource "aws_s3_bucket" "cloudfront_logs" {
  region = "us-west-1"

  bucket_prefix = "terraform-cloudfront-logs-"
}
