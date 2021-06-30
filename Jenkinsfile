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
                    sh "scp -r  ${WORKSPACE}/build/ 172.31.50.89:/var/www/jenkins-react-app"
                }
            }
        }
     }
}