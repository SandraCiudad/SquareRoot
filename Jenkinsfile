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
                sh 'g++ -o testResults sqrt.cpp sqrt_test.cpp -lcppunit --coverage -g -O0 -I/usr/include/ -L/usr/lib/ -lgtest -lgtest_main  -pthread'
                sh 'gcovr -r .. cov.html'
            }
        }
        stage ('Test code coverage') {
            steps {
                publishHTML([allowMissing: false, 
                alwaysLinkToLastBuild: false, 
                keepAll: false, 
                reportDir: '/home/sandra/Escritorio/SquareRoot', 
                reportFiles: 'cov.html', 
                reportName: 'Code Coverage Report', 
                reportTitles: 'Coverage Report'])
            }
        }
    }
}