pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                echo 'Building...'
                sh 'cmake -S . -B build'
                sh 'cmake --build build'
                sh 'make || true'
            }
        }
        stage('Test'){
            steps{
                echo 'Testing...'
                junit '/home/ci/Escritorio/SquareRoot/build/test_detail.xml'
            }
        }
    }
}