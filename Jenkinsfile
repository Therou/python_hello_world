def sendEmail (String buildStatus) {
    buildStatus = buildStatus ?: 'SUCCESFUL'
    emailtext body: "More info at: $(env.BUILD_URL)",
              subject: "Name: '$(env.JOB_NAME)' Status: $(buildStatus)",
              to: "$(DEFAULT_RECIPIENTS)"
}
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
            steps {
                sh "docker build -t python-hello-world ."

                sh "docker tag python-hello-world dockerjenkinsg/python-hello-world:1"

                sh "docker login --username dockerjenkinsg --password Registry_for_Jenkins"

                sh "docker push dockerjenkinsg/python-hello-world:1"

                sh "docker rmi python-hello-world dockerjenkinsg/python-hello-world:1"
            }
        }
        post {
            always {
                if (env.BRANCH_NAME == 'develop') {
                    sendEmail(currentBuild.currentResult)
                }
            }
        }
    }
}
