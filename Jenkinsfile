pipeline {
     agent any
     stages {
        stage("Build") {
            steps {
                sh "sudo npm install"
                sh "sudo npm run build"
            }
        }
        stage("Deploy") {
            steps {
               sshagent(['SSH_key']) {
                     sh "sudo rm -rf   /var/www/jenkins-react-app"
                     sh "scp -o StrictHostKeyChecking=no ${WORKSPACE}/build/ ec2-user@35.153.83.105:/var/www/jenkins-react-app/
               }
                
            }
        }
        stage("start") {
            steps {
                 sh "screen -d -m -S screen.npmStart npm start"
            }
        }
    }
}