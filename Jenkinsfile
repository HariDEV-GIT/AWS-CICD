pipeline {
    agent any
    options { disableConcurrentBuilds() }
    stages {
        stage('Terraform Init - Devevlop') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws_jenkins_user_develop', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]){
                        sh '''#!/bin/bash
                            ./terraform init
                            ls
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
/*        stage('Terraform Apply - Develop') {
            when {branch 'develop'}
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws_jenkins_user_develop', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID'),
                    file(credentialsId: "secrets_tfvars", variable: 'secrets_vars')
                    ]) {
                        sh '''#!/bin/bash
                            ./terraform apply -auto-approve -var-file="./tfvars/dev.tfvars" -var-file="${secrets_vars}"
                            '''
                }
            }
        }
        stage('Terraform Apply - Prod') {
            when {branch 'prod'}
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws_jenkins_user_prod', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID'),
                    file(credentialsId: "secrets_tfvars", variable: 'secrets_vars')
                    ]) {
                        sh '''#!/bin/bash
                            ./terraform apply -auto-approve -var-file="./tfvars/dev.tfvars" -var-file="${secrets_vars}"
                            '''
                }
            }
        } */

/*
        stage('Terraform destroy') {
            when {branch 'master'}
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws_user', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID'),
                    file(credentialsId: "secrets_tfvars", variable: 'secrets_vars')
                    ]) {
                        sh '''#!/bin/bash
                            ./terraform destroy -auto-approve -var-file="./tfvars/dev.tfvars" -var-file="${secrets_vars}"
                            '''
                }
            }
        }
        
        */
    }
    post {
        cleanup {
            deleteDir()
        }
    }
}
