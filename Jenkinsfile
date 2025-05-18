pipeline {
    agent any
    stages {
        stage('List workspace') {
            steps {
                sh '''#!/bin/bash
                    ls -la ${workspace}
                '''
            }
        }
        stage('Terraform version') {
            steps {
                sh '''
                    terraform version
                   '''
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'jenkins_admin_user', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]){
                        sh '''#!/bin/bash
                            ./terraform init
                            ls
                            '''
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'jenkins_admin_user', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID'),
                    file(credentialsId: "secrets_tfvars", variable: 'secrets_vars')
                    ]) {
                        sh '''#!/bin/bash
                            ./terraform plan -var-file="./tfvars/dev.tfvars" -var-file="${secrets_vars}"
                            '''
                }
            }
        }
/*        stage('Terraform Apply') {
            when {branch 'main_backup'}
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws_user', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID'),
                    file(credentialsId: "secrets_tfvars", variable: 'secrets_vars')
                    ]) {
                        sh '''#!/bin/bash
                            ./terraform apply -auto-approve -var-file="./tfvars/dev.tfvars" -var-file="${secrets_vars}"
                            '''
                }
            }
        } */
    }
    post {
        cleanup {
            deleteDir()
        }
    }
}                        '''
                 }
            }
        }
*/
