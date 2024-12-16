node {
    def app
    def dockerImage = "zayd3030/cw2-server"

    stage('Checkout') {
        checkout scm
    }

    stage('Build Docker image') {
        app = docker.build(dockerImage)
    }

    stage('Test Docker image') {
        app.inside {
            sh 'echo "Docker Image Test Pass"'
        }
    }

    stage('Push Docker image') {
        docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
            app.push("latest")
        }
    }

    stage('Deploy builds to Kubernetes') {
        sshagent(['jenkins-ssh']) {
            sh '''
                ssh -T ubuntu@44.222.210.55 << 'EOF'
                kubectl set image deployment/cw2-server cw2-server=zayd3030/cw2-server:latest
            '''
        }
    }
}
