#resource "aws_glue_job" "album_artist" {
#  name     = "join-album_artist"
#  role_arn = "aws_iam_role.example.arn"
#  command {
#    name            = "glue-etl"
#    script_location = "code/glue/glue-etl.py"
#  }
#}
resource "aws_iam_policy_attachment" "glue_policy_attachment" {
  name       = "glue_policy_attachment"
  roles      = [aws_iam_role.glue_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_glue_crawler" "spotify_tb_crawler" {
  name                  = "spotify_tb_crawler"
  database_name         = "spotify_db"
  role                 = aws_iam_role.glue_role.arn
  s3_target {
    path = "s3://staging-data-891377294764/spotify/*"
  }
}


