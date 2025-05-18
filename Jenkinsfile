pipeline {
    agent any

    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'main_backup', url: 'https://github.com/HariDEV-GIT/AWS-CICD.git'
            }
        }
        stage ("terraform format check") {
            steps {
                withCredentials([usernamePassword(credentialsId: "jenkins_admin_user_develop", usernameVariable: "AWS_ACCESS_KEY_ID", passwordVariable: "AWS_SECRETS_ACCESS_KEY")]) {
                    sh('''
                        terraform fmt
                        git status
                        echo $BRANCH_NAME
                        git checkout $BRANCH_NAME
                        git add *.tf
                        git commit -am "Terraform fmt by Jenkins"
                        git status
                        git remote add hari https://${AWS_ACCESS_KEY_ID}:${AWS_SECRETS_ACCESS_KEY}@github.com/HariDEV-GIT/jenkins-terraform.git
                        git push -u hari $BRANCH_NAME
                    ''')
                }   
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
