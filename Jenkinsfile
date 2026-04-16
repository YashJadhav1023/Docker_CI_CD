pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Deploy to App Server') {
            steps {
                sshagent(['jenkins_server']) {
                    sh """
ssh -o StrictHostKeyChecking=no ec2-user@172.31.11.226 << 'EOF'
cd /my_project/docker-fastapi-test
git pull origin main
DOCKER_BUILDKIT=0 docker-compose up -d --build
EOF
                    """
                }
            }
        }
    }
}
