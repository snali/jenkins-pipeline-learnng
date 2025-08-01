pipeline {
    agent any
    stages {
        stage('Post-Build Actions') {
            steps {
                    echo "Running post-build actions..."
            }
        }
    }
    post {
        success {
            echo "Post activity is successfully completed"
        }
        failure {
            echo"Post activity is failure called"
        }
        always{
            echo "Always Block Triggers"
        }
    }
}