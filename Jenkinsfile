
pipeline {
    agent any 
  environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
        disableConcurrentBuilds()
        timeout(time: 1, unit: 'HOURS') 
        timestamps()
      }
    stages {
        stage('Setup parameters') {
            steps {
                script {
                    properties([
                        parameters([
                        choice(
                              choices: ["Load-test", "Server-test", "E2e-est", "Functional-test", "Regression-test", "Integration-test" ], 
                              name: 'TEST'
                           
                                ),


                             string(name: 'AUTH',
                             defaultValue: '',
                            description: '''Enter the AUTH service tag starting with v example v1.1.0 '''),


                             string(name: 'DB',
                             defaultValue: '',
                            description: '''Enter the DB service tag with v example v1.1.0 '''),


                             string(name: 'REDIS',
                             defaultValue: '',
                            description: '''Enter the REDIS  service tag with v example v1.1.0 '''),

                             string(name: 'UI',
                             defaultValue: '',
                            description: '''Enter the UI  service tag with v example v1.1.0 '''),

                             string(name: 'WEATHER',
                             defaultValue: '',
                            description: '''Enter the WEATHER  service tag with v example v1.1.0'''),
                        ])
                    ])
                }
            }
        }



    stage('check entry') {

			steps {
				sh ''' 
                bash $WORKSPACE/weatherapp/qa.sh $AUTH $DB $REDIS  $UI $WEATHER 
                '''
			}
		}

    stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

    stage('pulling  auth') {

			steps {
				sh '''
    docker pull devopseasylearning/weatherapp-auth:$AUTH
                  '''
			}
		}


    stage('pulling db  ') {

			steps {
				sh '''
    docker pull devopseasylearning/weatherapp-db:$DB
                  '''
			}
		}
    stage('pulling redis ') {

			steps {
				sh '''
    docker pull devopseasylearning/weatherapp-redis:$REDIS
                  '''
			}
		}

    stage('pulling  UI ') {

			steps {
				sh '''
    docker pull devopseasylearning/weatherapp-ui:$UI

                  '''
			}
		}

      stage('pulling  weather ') {

			steps {
				sh '''
    docker pull devopseasylearning/weatherapp-weather:$WEATHER 
                  '''
			}
		}


    stage('load test ') {
      when{      
          expression {
            env.TEST == 'Load-test' }
          
            }
            steps {
                sh '''
             sleep 10 

                '''
            }
        }

    stage('server  test ') {
      when{      
          expression {
            env.TEST == 'Server-test' }
          
            }
            steps {
                sh '''
             sleep 10 

                '''
            }
        }

    stage('E2E  test ') {
      when{      
          expression {
            env.TEST == 'E2e-test' }
          
            }
            steps {
                sh '''
             sleep 10 
                '''
            }
        }

    stage('functional   test ') {
      when{      
          expression {
            env.TEST == 'Functional-test' }
          
            }
            steps {
                sh '''
             sleep 10 
                '''
            }
        }

    stage('regression   test ') {
      when{      
          expression {
            env.TEST == 'Regression-test' }
          
            }
            steps {
                sh '''
             sleep 10 
                '''
            }
        }


    stage('integration   test ') {
      when{      
          expression {
            env.TEST == 'Integration-test' }
          
            }
            steps {
                sh '''
             sleep 10 
                '''
            }
        }

}



   post {
   
   success {
      slackSend (channel: '#testing-alerts', color: 'good', message: "Test type $TEST ,  Application The_Weather_app SUCCESSFUL:  Branch name  <<${env.BRANCH_NAME}>>  Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }

 

    failure {
      slackSend (channel: '#testing-alerts', color: '#FF0000', message: "Test type $TEST , Application The_Weather_app FAILURE:  Branch name  <<${env.BRANCH_NAME}>> Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }
   
    cleanup {
      deleteDir()
    }
}






}


