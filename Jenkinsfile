pipeline {
    agent any
    environment {
        DOCKERHUB_CREDS=credentials('dockerhub-credentials')
    }
    stages {
        stage("Building image") {
            steps {
                sh """
                    docker build -t $DOCKERHUB_CREDS_USR/hello_python_conda:latest .
                """
            }
        }
        stage('Login into Dockerhub') {
            steps {
                sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin'
            }
        }
        stage('Pushing to Dockerhub') {
            steps {
                sh 'docker push $DOCKERHUB_CREDS_USR/hello_python_conda:latest'
            }
        }
        stage("Running") {
            when {
                expression {
                    return env.GIT_BRANCH == "origin/main"
                }
            }
            steps {
                sh """
                    docker run --rm $DOCKERHUB_CREDS_USR/hello_python_conda:latest
                """
            }
        }
    }
    	post {
            always {
                sh 'docker logout'
            }
	}
}