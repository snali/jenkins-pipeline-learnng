pipeline {
    agent any
    stages{
        stage ("Build"){
            steps{
                retry(3) {
                    echo "Building the project..."
                    // Simulate build process
                    sh 'echo "Build successful!"'
                }
                echo "Build stage completed."
            }

        }
    }
}


//Timeout for the build stage 

pipeline {
    agent any
    stages{
        stage{ ("Build with Timeout"){
            steps{
                timeout(time: 10, unit: 'MINUTES') {
                    //retry(3) {
                        echo "sleep for 60 seconds the project with timeout..."
                        // Simulate build process
                        sh 'sleep 60'
                    }
                }
                echo "Build stage with timeout completed."
            }
        }
    }
}