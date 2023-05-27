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
        stage("Code Review"){
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'SonarToken') {
                        sh 'mvn sonar:sonar'
                    }
                    timeout(time: 1, unit: 'HOURS') {    //qualitGate is true then the rest will run else fail the pipeline
                      waitForQualityGate abortPipeline: true, credentialsId: 'SonarToken'
                    }
                }
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
                sh 'docker build -t anujatel/newbuild-$BUILD_NUMBER .'
            }
        }
        stage("push to docker hub"){
            steps{
                withCredentials([string(credentialsId: 'DockerHubPasswd', variable: 'passwd')]) {
                    sh 'docker login -u anujatel -p $passwd'
                }
                sh 'docker push anujatel/newbuild-$BUILD_NUMBER'
            }
        }
    }
}
