resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "website_bucket" {
  name                        = "website-bucket-${random_id.bucket_prefix.hex}"
  location                    = "EU"
  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_iam_binding" "website_bucket_public_access" {
  bucket  = google_storage_bucket.website_bucket.name
  role    = "roles/storage.objectViewer"
  members = ["allUsers"]
}

resource "google_storage_bucket_object" "index_html" {
  bucket       = google_storage_bucket.website_bucket.name
  name         = "index.html"
  source       = "../website/index.html"
  content_type = "text/html"
}

resource "google_storage_bucket_object" "error_html" {
  bucket       = google_storage_bucket.website_bucket.name
  name         = "404.html"
  source       = "../website/404.html"
  content_type = "text/html"
}

resource "google_storage_bucket_object" "me_png" {
  bucket       = google_storage_bucket.website_bucket.name
  name         = "me.png"
  source       = "../website/me.png"
  content_type = "image/png"
}