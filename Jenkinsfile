pipeline {
    agent any
    options {
        disableConcurrentBuilds()
    }
    environment {
        TF_HOME = '/usr/bin/terraform'
    }
    stages {
        stage('List workspace') {
            steps {
                sh '''
                    ls -la
                    pwd
                '''
            }
        }
        stage('Terraform Init - Develop') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws_jenkins_user_develop', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                    sh "${TF_HOME}/terraform init"
                }
            }
        }
        stage('Terraform Init - Prod') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws_jenkins_user_prod', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                    sh "terraform init"
                }
            }
        }
        stage('Terraform Plan - Develop') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws_jenkins_user_develop', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID'),
                                 file(credentialsId: "secrets_tfvars", variable: 'secrets_vars')]) {
                    sh "terraform plan -var-file='./tfvars/dev.tfvars' -var-file='${secrets_vars}'"
                }
            }
        }
        stage('Terraform Plan - Prod') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws_jenkins_user_prod', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID'),
                                 file(credentialsId: "secrets_tfvars", variable: 'secrets_vars')]) {
                    sh "terraform plan -var-file='./tfvars/prod.tfvars' -var-file='${secrets_vars}'"
                }
            }
        }
    }
}
