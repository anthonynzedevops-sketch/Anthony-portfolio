# Anthony Nze - DevOps Portfolio

A personal portfolio website showcasing my DevOps learning journey, technical skills, projects and CV.

## Technologies

- HTML5, CSS3 and JavaScript
- Docker
- Nginx
- AWS EC2
- Git and GitHub

## Project Structure

```text
anthony-portfolio/
├── Dockerfile
├── README.md
├── static/
│   ├── css/
│   ├── files/
│   ├── images/
│   └── js/
└── templates/
    └── index.html
```

## Build and Run Locally

Build the Docker image:

```bash
docker build -t anthony-portfolio:v1 .
```

Run the container:

```bash
docker run -d --name anthony-portfolio -p 8081:80 --restart unless-stopped anthony-portfolio:v1
```

Visit http://localhost:8081

Check running containers:

```bash
docker ps
```

View container logs:

```bash
docker logs anthony-portfolio
```

## AWS EC2 Deployment

The portfolio runs in a Docker container on an Ubuntu EC2 instance.

- Web server: Nginx
- Container port: 80
- EC2 host port: 8081
- Public URL: http://13.62.50.97:8081

The existing DevOps Level Up website runs separately and must not be stopped or replaced during portfolio deployments.

## Security Group

| Type | Port | Source |
|---|---:|---|
| SSH | 22 | Administrator's IP |
| HTTP | 80 | 0.0.0.0/0 |
| Custom TCP | 8081 | 0.0.0.0/0 |

## Rollback

Execute these commands on the EC2 server, not your local computer. The previous image is tagged `anthony-portfolio:v1`.

```bash
sudo docker stop anthony-portfolio
sudo docker rm anthony-portfolio
sudo docker run -d --name anthony-portfolio -p 8081:80 --restart unless-stopped anthony-portfolio:v1
```

## Author

**Anthony Nze**

Aspiring DevOps Engineer

- GitHub: https://github.com/anthonynzedevops-sketch
- LinkedIn: https://www.linkedin.com/in/anthony-nze-210847446/
- Email: anthonynze.devops@gmail.com
