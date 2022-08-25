node {
stage("codecheckout") {
git credentialsId: '9467d93a-90c3-4773-bfef-3f8fbfd10c71', url: 'https://github.com/DevOps-Traning/Maven-Web-Project.git'
}

stage("mavenbuild")
{
def mvnHOME = tool name: 'linuxmaven', type: 'maven'
sh "${mvnHOME}/bin/mvn clean package"
}

stage("tomcatdeployment") 
{
sh 'cp /home/ec2-user/.jenkins/workspace/myfirstpipeline/target/*.war /home/ec2-user/tomcat/apache-tomcat-9.0.65/webapps'
}
}
