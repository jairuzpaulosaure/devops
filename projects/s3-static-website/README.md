## Project Overview
This project demonstrates how to host a static website using Amazon S3 and Amazon CloudFront.
The goal was to understand secure content delivery, bucket permissions, and CDN caching behavior.

## Architecture
User → CloudFront (CDN) → S3 Bucket (Static Website)

- S3 stores static files (HTML)
- CloudFront serves content publicly
- S3 bucket remains private

## AWS Services used
- Amazon S3 (static file storage)
- Amazon CloudFront (content delivery network)
- IAM (access control via bucket policies)


## Step-by-Step Implementation
1. Created an S3 bucket with a globally unique name.
2. Uploaded an index.html file.
3. Configured CloudFront with the S3 bucket as origin.
4. Enabled Origin Access Control (OAC).
5. Set index.html as the default root object.
6. Verified public access through CloudFront URL.

## Troubleshooting & Common Issues
#### Access Denied Error
Cause: Incorrect bucket policy or CloudFront access.
Fix: Updated S3 bucket policy to allow CloudFront access.

#### Old Content Still Showing
Cause: CloudFront caching.
Fix: Created cache invalidation.

#### index.html Not Loading
Cause: File not in bucket root.
Fix: Uploaded index.html to the correct location.


## Lesson Learned
- Learned how CloudFront securely accesses private S3 buckets.
- Understood the impact of CDN caching.
- Gained confidence troubleshooting AWS permission issues.

## Screenshots
- S3 bucket configuration
- CloudFront distribution
- Website live in browser

