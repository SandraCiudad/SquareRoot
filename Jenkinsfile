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
                junit 'test_detail.xml'
            }
        }
        post {
            always{
                xunit (
                    thresholds: [ skipped(failureThreshold: '0'), failed(failureThreshold: '0') ],
                    tools: [ BoostTest(pattern: 'build/*.xml') ]
                )
            }
    }
    }
}