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
                sshagent(['keys']) {
                    sh "scp -r  ${WORKSPACE}/build/ ec2-user@172.31.50.89:/home/ec2-user"
                }
            }
        }
     }
}