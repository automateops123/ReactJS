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
                    sh "scp -o -r StrictHostKeyChecking=no  ${WORKSPACE}/build/ ec2-user@52.72.11.239:/home/ec2-user"
                }
            }
        }
     }
}