pipeline {
    agent any
    stages {
        stage('Build'){
            steps{
                echo 'Building...'
                sh 'cmake -S . -B build'
                sh 'cmake --build build'
                sh 'make || true'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                dir('build') {
                    sh 'ctest -T test --no-compress-output'
                }
            }
        }
    }
    post {
        always {
            // Archive the CTest xml output
            archiveArtifacts (
                artifacts: 'build/*.xml',
                fingerprint: true
            )

            // Process the CTest xml output with the xUnit plugin
            xunit (
                testTimeMargin: '3000',
                thresholdMode: 1,
                thresholds: [
                    skipped(failureThreshold: '0'),
                    failed(failureThreshold: '0')
                ],
            tools: [CTest(
                pattern: 'build/*.xml',
                deleteOutputFiles: true,
                failIfNotNew: false,
                skipNoTestFiles: true,
                stopProcessingIfError: true
                )]
            ) 

            // Clear the source and build dirs before next run
            deleteDir()
        }
    } 
}