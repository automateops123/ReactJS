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
                     sh "scp -r StrictHostKeyChecking=no ${WORKSPACE}/build/ ec2-user@172.31.60.103:/var/www/jenkins-react-app/"
               }
                
            }
        }
    }
}