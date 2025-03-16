pipeline {
    agent any

    tools {
        // Use the Maven tool defined in Jenkins Global Tool Configuration
        maven "Maven"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/kollyns/NumberGuessGame.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Archive WAR Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh 'scp -o StrictHostKeyChecking=no -i ~/Ceeyit-class.pem target/*.war ec2-user@3.12.154.250:/home/ec2-user/apache-tomcat-7.0.94/webapps/'
            }
        }
    }

    post {
        success {
            echo "✅ Build, Test and Deployment completed successfully"
        }
        failure {
            echo "❌ Build failed. Please check logs."
        }
    }
}
