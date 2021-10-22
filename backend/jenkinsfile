pipeline {
    agent {
        docker {
            image 'ruby'
            args '--network skynet'
        }
    }

    stages {
        stage('Build') {
            steps{
                echo "Compilando e/ou baixando dependencias"
                sh 'cd backend && bundle install'
            }
        }

        stage('Test') {
            steps {
                echo 'Executando tests'
                sh 'cd backend && rspec -fd --format RspecJunitFormatter --out rspec.xml'
                
            }
            post {
                always {
                    junit 'backend/rspec.xml'
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