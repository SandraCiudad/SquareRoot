pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                echo 'Building...'
                sh 'cmake -S . -B build'
                sh 'cmake --build build'
            }
        }
        stage('Test'){
            steps{
                echo 'Testing...'
                make
            }
        }
    }
}