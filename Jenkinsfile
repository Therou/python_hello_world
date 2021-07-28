pipeline {
    agent {
        label 'workers'
    }

    stages {
        stage ('Checkout') {
            steps {
                checkout scm
            }
        }

        stage ('Build Docker image') {
            sh "docker build -t python-hello-world ."

            sh "docker tag python-hello-world dockerjenkinsg/python-hello-world:1"

            sh "docker login --username dockerjenkinsg --password Registry_for_Jenkins"

            sh "docker push dockerjenkinsg/python-hello-world:1"

            sh "docker rmi python-hello-world dockerjenkinsg/python-hello-world:1"
        }
    }
}
