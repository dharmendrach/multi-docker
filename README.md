# multi-docker

Deploying multiple docker containers application using Travis CI on AWS Elastic Beanstalk.

## Components 
- **Server** - A node application which connect with postgres and redis and have few APIs for getting data and submiting data which will be called by react app.
- **Worker** - A node application which constantly monitor redis for new input to do some work ( Calculate Fib number)
- **Client** - A react app which render a UI and call server APIs
- **nginx** - Used for creating http routing for Server and Client
- **postgres** - A DB server
- **redis** - Used for caching

## Notes
- We have different dockerfiles for developement and production.
- Nginx is used for deploying build folder of react app.
- Travis CI will do sanity testing and create production Docker images and push images to Dockerhub.
