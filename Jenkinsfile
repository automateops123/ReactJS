pipeline {
     agent any
     stages {
        stage("Build") {
            steps {
                sh "sudo npm install"
                sh "sudo npm run build"
                sh "sudo mkdir /app"
                sh "sudo copy . ."
            }
        }
         stage("Deploy") {
            steps {
               sshagent(['SSH_key']) {
                     sh "sudo rm -rf   /var/www/jenkins-react-app"
                     sh "chmod -R 777 /var/lib/jenkins/workspace/Without_Docker/app"
                     sh "scp -o StrictHostKeyChecking=no ${WORKSPACE}/app/ ec2-user@172.31.60.103:/var/www/jenkins-react-app/"
               }
                
            }
        }
    }
}