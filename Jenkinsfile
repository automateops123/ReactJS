pipeline {
     agent any
     stages {
        stage("Build") {
            steps {
                sh "npm install"
                sh "npm run build"
            }
        }
        stage("Deploy") {
            steps {
                sh "rm -rf /var/www/jenkins-react-app"
                sh "cp -r ${WORKSPACE}/build/ /var/www/jenkins-react-app/"
            }
         }
        stage("start") {
            steps {
              sh "screen -d -m -S screen.npmStart npm start"
            
            }
        }
    }
}