pipeline {
    agent any

    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'main_backup', url: 'https://github.com/HariDEV-GIT/AWS-CICD.git'
            }
        }
        stage ("terraform init") {
            steps {
                sh 'terraform init'
            }
        }    
        stage ("terraform validate") {
            steps {
                sh 'terraform validate'
            }
        }
        stage ("terrafrom plan") {
            steps {
                sh 'terraform plan '
            }
        }
        stage ("terraform apply") {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }
}
