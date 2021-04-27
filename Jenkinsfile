pipeline {
    agent any
    stages {
        
        stage('Build API') {
           steps {
               sh "nohup mvn spring-boot:run &"
                sleep(20)
                 }
           }
        
        stage('Build Website') {
            steps {
               sh "nohup curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar java -jar ./rawhttp.jar serve . -p 4200 &"   
                sleep(3)
                  }
           }
 
        stage('Robot Framework System tests with Selenium') {
            steps {
                sh 'robot --variable BROWSER:headlesschrome -d Results Tests'
            }
            post {
                always {
                    script {
                          step(
                                [
                                  $class              : 'RobotPublisher',
                                  outputPath          : 'Results',
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
