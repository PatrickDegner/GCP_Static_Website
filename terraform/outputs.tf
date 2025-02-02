output "website_url" {
  value = "http://storage.googleapis.com/${google_storage_bucket.website_bucket.name}/index.html"
}