pipeline {
  agent any
  options { timestamps() }
  environment {
    RECIPIENT = 'your_email@example.com'
  }
  stages {
    stage('Checkout') {
      steps { checkout scm }
    }
    stage('Run Script') {
      steps {
        sh 'chmod +x scripts/run.sh'
        sh 'scripts/run.sh'
      }
    }
    stage('Archive Output') {
      steps { archiveArtifacts artifacts: 'output.txt', fingerprint: true }
    }
  }
  post {
    success {
      emailext(
        to: "${env.RECIPIENT}",
        subject: "✅ SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
        body: "Build succeeded. See ${env.BUILD_URL}",
        attachmentsPattern: 'output.txt'
      )
    }
    failure {
      emailext(
        to: "${env.RECIPIENT}",
        subject: "❌ FAILURE: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
        body: "Build failed. See ${env.BUILD_URL}",
        attachLog: true
      )
    }
  }
}
