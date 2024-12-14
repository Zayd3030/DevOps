node {
    def app
    def dockerImage = "zayd3030/cw2-server"

    stage('Checkout') {
        checkout scm
    }

    stage('Build Docker image') {
        app = docker.build(dockerImage)
    }

}
