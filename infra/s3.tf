#######################################################################################################
##                                 BUCKET S3                                                       ##
#######################################################################################################

#Criando o bucket de recebimento dos dados
resource "aws_s3_bucket" "staging-data-891377294764" {
  bucket = "staging-data-891377294764"
}

#Upload dos arquivos spotify - fonte https://www.kaggle.com/datasets/tonygordonjr/spotify-dataset-2023?resource=download
resource "aws_s3_object" "spotify_album" {
  bucket     = aws_s3_bucket.staging-data-891377294764.bucket
  key        = "spotify/spotify_album.csv"
  source     = "../attached-files/spotify-albums_data_2023.csv"
  depends_on = [aws_s3_bucket.staging-data-891377294764]
}

resource "aws_s3_object" "spotify_artist" {
  bucket     = aws_s3_bucket.staging-data-891377294764.bucket
  key        = "spotify/spotify_artist.csv"
  source     = "../attached-files/spotify_artist_data_2023.csv"
  depends_on = [aws_s3_bucket.staging-data-891377294764]
}

resource "aws_s3_object" "spotify_track" {
  bucket     = aws_s3_bucket.staging-data-891377294764.bucket
  key        = "spotify/spotify_track.csv"
  source     = "../attached-files/spotify_tracks_data_2023.csv"
  depends_on = [aws_s3_bucket.staging-data-891377294764]
}


