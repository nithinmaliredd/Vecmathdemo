pipeline {
  agent any
  
  stages { 
        stage ('print') {
            steps {
                echo 'Hello World'
            }
        }
        stage ('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nithinmaliredd/Vecmathdemo.git']]])
            }
        }
        stage ('build') {
            steps{
                sh 'mvn clean verify'
                sh 'mvn install'
            }
        }
    }   
    post {
            always {
                 echo 'Thanks for running the job'
            }
        }
}
