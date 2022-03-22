pipeline {
  agent any

  stages {
    stage ('Git') {
      steps {
            git branch: 'main', url: 'https://github.com/kupa2004/Cert.git'
      }
    }

    stage('Instances by terraform') {
      steps {
        sh 'terraform -chdir=terraform/ init'
        sh 'terraform -chdir=terraform/ apply -var "name1=builder08" -var "name2=stage08" --auto-approve'
      }
    }

    stage('Ansible') {
      steps {
        retry(count: 5) {
        sh 'ansible-playbook -i ansible/aws_ec2.yaml ansible/build.yml  --vault-password-file /home/test/pass -vvv'
        }
      }
    }
  }
}