pipeline {
    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10'))
}
    agent any
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
        string(name:'BRANCH_NAME',defaultValue:"main",description:"Branch to build")

        }
    stages {
        stage('Hello') {
            steps {
                script {
                    echo "Hello ${params.PERSON} from branch ${params.BRANCH_NAME}"
                }
            }
        }
    }
}
