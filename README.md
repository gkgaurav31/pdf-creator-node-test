# STEPS TO TEST

### Build Docker Image

docker build -t test .

### Remove test container if already running

docker rm -f test

### Start the container and expose port 5000 (for app) and 2222 for SSH

docker run -d -p 8080:8080 --name test test

### Now go to localhost:8080 in your browser

### THIS IS A SAMPLE AND IS NOT MAINTAINED
