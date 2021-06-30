pipeline {
     agent any
     stages {
        stage("Build") {
            steps {
                sh "npm install"
                sh "npm run build"
            }
        }
        stage("Deploy"){
            steps{
                sshagent(['ssh_agent']) {
                    sh "scp -r ${WORKSPACE}/build/ ec2-user@172.31.60.103:/var/www/jenkins-react-app/"
                }
            }
        }
     }
}