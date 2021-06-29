pipeline {
     agent any
    stages {
        stage("Build") {
            steps {
                sh "npm install"
                sh "sudo npm run build"
            }
        }
        stage("Deploy"){
            steps{
                sshagent(['SSH_key']) {
                    sh "scp -r ${WORKSPACE}/build/ ec2-user@172.31.60.103:/var/www/jenkins-react-app/"
                }
                
            }                
        }
    }
}      