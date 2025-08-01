pipeline {
    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10'))
}
    agent any
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
        string(name:'BRANCH_NAME',defaultValue:"main",description:"Branch to build")
        booleanParam(name:'RUN_TESTS', defaultValue: true, description: 'Run tests?')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'test', 'prod'], description: 'Select the environment to deploy')

        }
    stages {
        stage('Hello') {
            steps {
                script {
                    echo "Hello ${params.PERSON} from branch ${params.BRANCH_NAME}"
                    echo "Running tests: ${params.RUN_TESTS}"
                    echo "Deploying to environment: ${params.ENVIRONMENT}"
                }
            }
        }
    }
}
