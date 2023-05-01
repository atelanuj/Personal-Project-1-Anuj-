//By Anuj
pipeline{
    agent any
    tools{
        maven "myMaven"
    }
    stages{
        stage("checkout"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/atelanuj/jenkins-mvn-docker-Project-3-.git']])
            }
        }
        stage("Build"){
            steps{
                sh 'pwd'
                sh 'ls -l'
                sh 'mvn clean install'
                sh 'ls -l'
            }
        }
        stage("Docker image BUILD"){
            steps{
                sh 'docker build -t anujatel/newbuild .'  //you also give BUILD_ID  anujatel/newbuild:$BUILD_ID
            }
        }
        stage("push to docker hub"){
            steps{
                withCredentials([string(credentialsId: 'DockerHubPasswd', variable: 'passwd')]) {
                    sh 'docker login -u anujatel -p $passwd'
                }
                sh 'docker push anujatel/newbuild'  //anujatel/newbuild:$BUILD_ID
            }
        }
    }
}
