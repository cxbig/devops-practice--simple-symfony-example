# Simple Symfony Example | DevOps Practice

## Overview

This project demonstrates the deployment of a Symfony-based backend application on AWS with CI/CD automation via GitHub Actions.  
The solution focuses on infrastructure, automation, scalability, resilience, and maintainability.

## Features

- Minimal Symfony application with a `/health` endpoint.
- Containerized using Docker.
- CI/CD pipeline with GitHub Actions.
- Deployment target: AWS ECS on Fargate (free tier eligible).
- Infrastructure as Code (Terraform placeholders included).

## Repository Structure

- `app/` - Symfony application code & Dockerfile.
- `infrastructure/` - IaC templates (Terraform placeholders).
- `.github/workflows/` - GitHub Actions workflows.
- `SCENARIOS.md` - Scaling, rollback, caching, and troubleshooting strategies.

## Deployment Guide

1. Clone repo:

   ```zsh
   git clone git@github.com:cxbig/devops-practice--simple-symfony-example.git
   cd devops-practice--simple-symfony-example
   ```

2. Local run (docker-compose):

   ```zsh
   docker compose up -d
   curl http://localhost:8080/health
   ```

3. GitHub Actions workflow will:

   - Checkout code
   - Lint code (placeholder)
   - Prepare Docker build environment
   - Build Docker image
   - Push to AWS ECR (placeholder)
   - Deploy to AWS ECS Fargate (placeholder)
   - Run post-deploy health check
