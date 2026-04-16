pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // This pulls the latest code to the Jenkins server
                checkout scm
            }
        }
        stage('Deploy to App Server') {
            steps {
                // This uses the Credential ID you created in the previous step
                sshagent(['jenkins_server']) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ec2-user@172.31.11.226 << 'EOF'
                        cd /my_project/docker-fastapi-test
                        git pull origin main
                        docker-compose up -d --build
                    EOF
                    """
                }
            }
        }
    }
}
