# Multi Container Deployment on Elastic Beanstalk

Deploying multiple docker containers application using Travis CI on AWS Elastic Beanstalk. We have created overcomplicated Fibonacci Calculator, so we can try out a full scale deployment.

## Components 
- **Server** - A node application which connect with postgres database and redis. It have APIs for showing result from postgres DB and redis cache. 
- **Worker** - A node application which constantly monitor redis for new input submitted by user and calculate Fibonacci number.
- **Client** - A react app which render a UI with previously calculated results and allow to submit a new request.
- **nginx** - Used for creating http routing for Server and Client
- **postgres** - A DB server for storing number submitted by users for calculating Fibonacci numbers
- **redis** - Used for caching recently submitted numbers and corresponding calculated Fibonacci numbers.

## Notes
- We have different dockerfiles for developement and production.
- Nginx is used for deploying build folder of react app.
- Travis CI will do sanity testing and create production Docker images and push images to Dockerhub.
- Travis CI will send trigger to Elastic Beanstalk for updating application in deploy stage.
- For postgres, we will use AWS Releational Database service (RDS) in production setup.
- For redis, we can use AWS Elasti Cache (EC).
- We have done lots of setup on AWS side also. For all those details, you can go through this amazing [Udemy Course](https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/learn/lecture/16242264#announcements)
