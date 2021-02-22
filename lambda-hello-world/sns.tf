resource "aws_sns_topic" "blockchain" {
  name = "blockchain-topic"
}

output "sns-topic" {
  value = aws_sns_topic.blockchain.arn
}
