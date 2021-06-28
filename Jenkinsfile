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
                     sh "scp -o StrictHostKeyChecking=no ${WORKSPACE}/build/ ec2-user@54.90.7.194:/var/www/jenkins-react-app/"
               }
                
            }
        }
    }
}