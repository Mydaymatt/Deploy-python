pipeline {
  agent { node { lable '10.0.42.42' } }
  stages {
    stage('build') {
      steps {
        sh 'docker  build --rm -t sandbox-client:1.0 -f Dockerfile'
      }
    }
    stage('test') {
      steps {
        sh 'python test.py'
      }
      post {
        always {
          junit 'test-reports/*.xml'
        }
      }    
    }
  }
}
