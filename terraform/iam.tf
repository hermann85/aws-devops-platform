resource "aws_iam_role" "ec2_ssm_role" {
  name = "${var.environment}-ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-ec2-ssm-role"
      Role = "ssm"
    }
  )
}

resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2_ssm_profile" {
  name = "${var.environment}-ec2-ssm-profile"
  role = aws_iam_role.ec2_ssm_role.name

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-ec2-ssm-profile"
      Role = "instance-profile"
    }
  )
}