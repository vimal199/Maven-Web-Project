pipeline {
  agent any
  
  tools {
	maven 'linux-maven'
	dockerTool 'linux-docker'
	}
  environment{
  Ansible_Playbook_Path='/home/ansible/pushdockercomposefile.yml'
  }  
  stages {
    stage('code-checkout') {
	  steps {
	 git credentialsId: 'gitcred', url: 'https://github.com/DevOps-Traning/Maven-Web-Project.git'
	  }
	}
    stage('maven-build') {
	  steps {
		sh 'mvn clean package'
	  }
	}
    stage('artifact-uploader') {
	  steps {
		sh 'mvn deploy'
	  }
	}
    stage('Install-docker') {
	  steps {
		sh '''sudo yum install -y yum-utils device-mapper-persistent-data lvm2
			  sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
		      sudo yum install docker-ce -y
			  sudo systemctl start docker
			  sudo systemctl enable docker
			  sudo chown -R ec2-user:ec2-user /var/run/docker.sock
			  sudo chmod -R 777 /var/run/docker.sock'''
	  }
	}
    stage('build-docker-image') {
	  steps {
		sh 'docker build -t devops715/tushardevopsdemo .'
	  }
	}
    stage('upload-docker-image') {
	  steps {
		sh 'docker login -u devops715 -p Drithi@1321'
		sh 'docker push devops715/tushardevopsdemo'
	  }
	} 
    stage('copy-docker-compose') {
	  steps {
		sh 'scp /home/ec2-user/.jenkins/workspace/Myfirstcicd/docker-compose.yml ansible@13.233.168.198:/home/ansible'
	  }
	} 
    stage('invoke-ansible-playbook') {
	  steps {
		sh 'ssh ansible@13.233.168.198 ansible-playbook $Ansible_Playbook_Path'
	  }
	} 
	}
}
