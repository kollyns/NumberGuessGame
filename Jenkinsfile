pipeline {
    agent any
    options { timestamps()}
    tools {
        maven 'Maven'
    }
    environment {
        SONAR_PROJECT_KEY = 'Number-Guess-Game'
        SONAR_PROJECT_NAME = 'Number Guess Game'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/kollyns/NumberGuessGame.git'
            }
        }
        stage('SonarQube Analysis') {
            steps {
           withSonarQubeEnv('SonarQube') {
            withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {
                sh '''
                mvn verify sonar:sonar \
                -Dsonar.projectKey=Number-Guess-Game \
                -Dsonar.projectName='Number Guess  Game' \
                -Dsonar.login=$SONAR_TOKEN
                '''
                    }
                }
            }
         }
     
        stage('Test') {
            steps {
                sh 'mvn test'
                junit 'target/surefire-reports/*.xml'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }
        stage('Archive WAR Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }       

        stage('Deploy to Tomcat') {
            steps {
                sh 'scp -o StrictHostKeyChecking=no -i ~/Ceeyit-class.pem target/*.war ec2-user@3.148.138.66:/home/ec2-user/apache-tomcat-7.0.94/webapps/'
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
