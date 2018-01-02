resource "aws_sqs_queue" "pplcnt_cvjp_deadletter" {
  name                      = "pplcnt_cvjp_deadletter"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0
}

resource "aws_sqs_queue" "pplcnt_cvjp" {
  name                      = "${var.cvgo_sqs_name}"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 0
  redrive_policy            = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.pplcnt_cvjp_deadletter.arn}\",\"maxReceiveCount\":10}"
}
