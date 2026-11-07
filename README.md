# Anthony Nze - DevOps Portfolio

A responsive personal portfolio website showcasing my DevOps learning journey, technical skills, projects and CV.

## Technologies

- HTML5, CSS3 and JavaScript
- Nginx
- Docker
- AWS EC2
- AWS Systems Manager (SSM)
- Git and GitHub
- GitHub Actions
- AWS IAM and GitHub OIDC

## Project Structure

- `templates/` - Portfolio HTML
- `static/css/` - Website styling
- `static/js/` - Website JavaScript
- `static/images/` - Website images
- `static/files/` - Downloadable CV
- `.github/workflows/deploy.yml` - CI/CD pipeline
- `Dockerfile` - Nginx container configuration

## Build and Run Locally

Build the Docker image:

    docker build -t anthony-portfolio:v1 .

Run the container:

    docker run -d --name anthony-portfolio -p 8081:80 --restart unless-stopped anthony-portfolio:v1

Open:

    http://localhost:8081

Check containers:

    docker ps

View logs:

    docker logs anthony-portfolio

## AWS EC2 Deployment

The portfolio is hosted on an Ubuntu EC2 instance using Docker and Nginx.

- Web server: Nginx
- Container port: 80
- EC2 host port: 8081
- Public URL: http://13.62.50.97:8081

The existing DevOps Level Up website runs separately on port 80.

## CI/CD Pipeline

GitHub Actions automatically runs when code is pushed to the main branch. Manual workflow execution is also supported.

The pipeline:

1. Checks out the repository.
2. Validates required portfolio files.
3. Builds the Docker image.
4. Authenticates to AWS using GitHub OIDC.
5. Sends deployment commands through AWS Systems Manager.
6. Deploys the requested Git commit to EC2.
7. Checks deployment status and public HTTP availability.

The EC2 deployment script validates the commit, builds a versioned Docker image, replaces the portfolio container and performs a health check.

## Deployment and Rollback

The deployment script automatically attempts to restore the previous container image if a deployment fails during container replacement or health checking.

For a manual rollback, connect to EC2 and redeploy a previous commit that is still part of the main branch history:

    sudo /usr/local/sbin/deploy-portfolio-from-git 612ceed9b36601dcb162ef36ef666847c693d0a8

Check the running container:

    sudo docker ps

## Security

- GitHub Actions uses OIDC rather than long-lived AWS access keys.
- AWS deployment commands are sent through Systems Manager.
- SSH administrative access is restricted to the administrator's IP.
- The portfolio is served over the configured public web port.

## Links

- Live portfolio: http://13.62.50.97:8081
- GitHub repository: https://github.com/anthonynzedevops-sketch/Anthony-portfolio
- GitHub profile: https://github.com/anthonynzedevops-sketch
- LinkedIn: https://www.linkedin.com/in/anthony-nze-210847446/
- Email: anthonynze.devops@gmail.com

## Author

Anthony Nze

Aspiring DevOps Engineer
