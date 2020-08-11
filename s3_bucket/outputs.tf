output "s3_bucket" {
  value = "${aws_s3_bucket.s3_bucket.*.id}"
}
output "log_bucket" {
  value = "${aws_s3_bucket.log_bucket.*.id}"
}
