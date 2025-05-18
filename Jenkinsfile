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
                    usernamePassword(credentialsId: 'aws_user', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]){
                        sh '''#!/bin/bash
                            ./terraform init
                            ls
                            '''
                }
            }
        }
        stage('change') {
            when {
                anyOf {
                    changeset "variables.tf"
                    changeset "provider*"
                }
            }
            steps {
                sh "ls -lrt"
            }
        }
        stage('Clone Dockerfile Repo') {
            steps {
                sh '''#!/bin/bash
                    mkdir module
                '''
                dir("./module/") {
                    script {
                        git branch: 'master',
                            credentialsId: 'github',
                            url: 'https://github.com/jam1734/aws-cf-templates.git'
                    }
                    sh '''#!/bin/bash
                        echo env.BITBUCKET_REPOSITORY
                        echo ${getRepoName}
                    '''
                }
            }
        }
/*
        stage('Terraform destroy1') {
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
        stage('Terraform Plan') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws_user', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID'),
                    file(credentialsId: "secrets_tfvars", variable: 'secrets_vars')
                    ]) {
                        sh '''#!/bin/bash
                            ./terraform plan -var-file="./tfvars/dev.tfvars" -var-file="${secrets_vars}"
                            '''
                }
            }
        }
/*
        stage('Terraform Apply') {
            when {branch 'master'}
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
        }
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


/*
        stage('Terraform Path') {
            steps {
                withEnv(["PATH=${tool 'Terraform'}:$PATH"]) {
                    sh '''
                        terraform version
                        '''
                 }
            }
        }
*/
