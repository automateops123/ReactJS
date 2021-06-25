pipeline {
    agent any
     environment{
       DOCKER_TAG = getDockerTag()
  }

    tools {nodejs "nodejs-12"}

      stages("Cloning"){
          steps{
              git url :  "https://For_demo@bitbucket.org/For_demo/reactjs.git", branch : "master"
          }
      }

      stage("Build"){

          sh "docker build -t saikumar080319/react:${buildNumber} ." 
      }

      stage("Docker login & Push"){
          steps{
          withCredentials([string(credentialsId: 'Docker', variable: 'Docker')]) {
              sh "docker login -u saikumar080319 -p ${Docker} "
            }
             sh "docker push saikumar080319/react:${buildNumber} ."
          }
      }

      stage("Deploy"){
          sshagent(['ssh_keys']) {
              sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.60.103 docker rm -f customcontainer || true"
             sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.60.103 docker run -d -p 80:80 --name cont1 saikumar080319/react:${buildNumber} ."
           }
         
      }

}

def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
