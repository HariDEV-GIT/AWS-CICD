pipeline {
    agent any
    options { disableConcurrentBuilds() }
    stages {
        stage('List workspace') {
            steps {
                sh '''#!/bin/bash
                    ls -la ${workspace}
                    pwd
                    '''
            }
        }
        stage('Terraform version(build-in-tooling)') {
            steps {
           //     withEnv(["PATH=${tool 'Terraform'}:$PATH"]) {
                sh '''
                    terraform --version
                    pwd
                    '''
            }
        } 
        stage('Terraform Init - Devevlop') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws_jenkins_user_develop', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]){
                        sh '''
                            ${TF_HOME}/terraform init
                            '''
                }
            }
        }
        stage('Terraform Init - Pod') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws_jenkins_user_prod', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]){
                        sh '''#!/bin/bash
                            ./terraform init
                            ls
                            '''
                }
            }
        }
        stage('Terraform Plan - Develop') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws_jenkins_user_develop', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID'),
                    file(credentialsId: "secrets_tfvars", variable: 'secrets_vars')
                    ]) {
                        sh '''#!/bin/bash
                            ./terraform plan -var-file="./tfvars/dev.tfvars" -var-file="${secrets_vars}"
                            '''
                }
            }
        }
        stage('Terraform Plan - Prod') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws_jenkins_user_prod', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID'),
                    file(credentialsId: "secrets_tfvars", variable: 'secrets_vars')
                    ]) {
                        sh '''#!/bin/bash
                            ./terraform plan -var-file="./tfvars/dev.tfvars" -var-file="${secrets_vars}"
                            '''
                }
            }
        }

        
    }
}
