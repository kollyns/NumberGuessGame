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
        stage('SonarQube Analysis') {
            steps {
           withSonarQubeEnv('SonarQube-Server') {
            withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {
                sh "mvn clean verify sonar:sonar \
                -Dsonar.projectKey=Number-Guess-Game \
                -Dsonar.projectName='Number Guess  Game' \
                -Dsonar.host.url=http://18.188.79.225:9000 \
                -Dsonar.token=sqp_0ee4ea550e80deaa6bfa9002752d9fd6c342713e"
           }
           }
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
