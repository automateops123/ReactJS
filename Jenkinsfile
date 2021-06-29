pipeline {
    agent any
    environment{
    DOCKER_TAG = getDockerTag()
  }

    tools {nodejs "nodejs-12"}

      stages {
           stage ('Checkout SCM'){
             steps {
          checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://For_demo@bitbucket.org/For_demo/reactjs.git']]])
             }
        
      }     

      stage("Build"){
          steps{
              sh "npm install"
              sh "cp ${WORKSPACE}/Dockerfile /home/ec2-user"
              sh "docker build -f Dockerfile /var/lib/jenkins/workspace/React -t saikumar080319/react:${DOCKER_TAG}" 
          }
    
      }

      stage("Docker login & Push"){
          steps{
          withCredentials([string(credentialsId: 'Docker', variable: 'Docker')]) {
              sh "docker login -u saikumar080319 -p ${Docker} "
            }
             sh "docker push saikumar080319/react:${DOCKER_TAG}"
          }
      }

      stage("Deploy"){
          steps{ sshagent(['ssh_keys']) {
              sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.60.103 docker rm -f cont1 || true"
             sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.60.103 docker run -itd -p 80:80 --name cont1 saikumar080319/react:${DOCKER_TAG} ."
             
           }
        }
      }   
    }
}


def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}

