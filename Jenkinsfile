pipeline {
    agent any
    stages {
        stage('Build API') {
           steps {
               sh "nohup mvn spring-boot:run &"
             
           }
        }
        stage('Build Website') {
            steps {
               sh "nohup python -m http.server 4200 &"
               
           }
        }
        
        stage('Robot Framework System tests with Selenium') {
            steps {
                sh 'robot --variable BROWSER:headlesschrome -d Robot_tests/Results Robot_tests/Tests'
            }
            post {
                always {
                    script {
                          step(
                                [
                                  $class              : 'RobotPublisher',
                                  outputPath          : 'Robot_tests/Results',
                                  outputFileName      : '**/output.xml',
                                  reportFileName      : '**/report.html',
                                  logFileName         : '**/log.html',
                                  disableArchiveOutput: false,
                                  passThreshold       : 50,
                                  unstableThreshold   : 40,
                                  otherFiles          : "**/*.png,**/*.jpg",
                                ]
                          )
                    }
                }
            }
        }
        
    }
}
