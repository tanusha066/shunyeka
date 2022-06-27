resource "aws_s3_bucket" "shunekya" {
  bucket = "intershala-bucket"

  tags = {
    Name        = "intershala_bucket"
 
  }
}

resource "aws_s3_bucket_acl" "shunekya" {
  bucket = aws_s3_bucket.shunekya.id
  acl    = "private"
}