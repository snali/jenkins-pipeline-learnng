pipeline{
    agent any
    environment {
        //credentialsId = 'your-credentials-id' ,this id shold be same as in jenkins
        GITHUB_CREDS= credentials('your-credentials-id')
        name = 'your-username'
    }
    stages {
        stage('Build'){
            steps {
                echo "Github credentials: ${GITHUB_CREDS}"
                echo "Using credentials for user: ${GITHUB_CREDS.USR}"
                echo "password: ${GITHUB_CREDS.PSW}"
            }
        }
    }
}