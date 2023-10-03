pipeline {
    agent any
    stages {
        stage('Configuration'){
            steps{
                echo 'Configuration...'
                sh 'cmake -S . -B build'
                sh 'cmake --build build'
            }
        }
        stage('Build'){
            steps{
                echo 'Building...'
                sh 'make || true'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                dir('build'){
                    junit 'test_detail.xml'
                }
            }
        }
        stage ('Test code coverage') {
            steps {
                publishHTML([allowMissing: false, 
                alwaysLinkToLastBuild: false, 
                keepAll: false, 
                reportDir: '/home/sandra/Escritorio/CI_Jenkins/SquareRoot', 
                reportFiles: 'coverage.html', 
                reportName: 'Code Coverage Report', 
                reportTitles: 'Coverage Report'])
            }
        }
    }
}