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
                sh 'cp cpp2junit.xslt /home/ci/Escritorio/SquareRoot/build'
                sh 'cp /home/ci/Escritorio/SquareRoot/build/test_detail.xml /home/ci/Escritorio/SquareRoot'
                sh 'xsltproc -o junitTestResults.xml cpp2junit.xslt test_detail.xml'
                junit 'junitTestResults.xml '
            }
        }
    }
}