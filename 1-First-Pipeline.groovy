pipeline {
    agent any
    stages{
        stage ('First Stage'){
            steps {
                echo 'This is the first stage of the pipeline'

            }

        }
    }
}


//2 *************************

pipeline {
    agent {
        label 'Slave-1'
    }
    stages{
        stage ('Print Hostname'){
            steps {
                sh 'echo "Hostname: $(hostname)"'
            }
        }
    }
}