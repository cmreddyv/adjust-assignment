pipeline{
	agent any
	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-chandra')
	}
	stages {
		stage('Build') {
			steps {
				sh 'docker build -t chandra37933/webserver:v1 .'
			}
		}
		stage('Login') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
		stage('Push') {
			steps {
				sh 'docker push chandra37933/webserver:v1'
			}
		}
	}
	post {
		always {
			sh 'docker logout'
		}
	}

}