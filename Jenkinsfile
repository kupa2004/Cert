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
        sh 'terraform -chdir=terraform/ apply -var "name1=builder018" -var "name2=stage018" -var "keyname=my-key" -var "sgroup=sg-082fd21f7c55e274a" --auto-approve'     }
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