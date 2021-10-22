pipeline {
    agent {
        docker {
            image 'papitoio/rubywd:latest'
            args '--network skynet'
        }
    }

    stages {
        stage('Build') {
            steps{
                echo "Compilando e/ou baixando dependencias"
                sh 'bundle install'
            }
        }

        stage('Test') {
            steps {
                echo 'Executando tests'
                sh 'cucumber -p ci'
            }
            post {
                always {
                    cucumber customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'logs', pendingStepsNumber: -1, skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
                }
            }
        }

        stage('UAT') {
            steps {
                echo 'Teste de aceitacao'
                input message: 'Podemos ir para producao?'
            }
        }

        stage('Prod') {
            steps {
                echo 'App pronto para producao!'
            }
        }
        
    }
}