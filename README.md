# number-guess- - CeeyIT project

The **Number Guess App** application:
- Java Web Development (Servlet + JSP)
- Maven Build System
- CI/CD Pipeline Automation
- Code Quality Scanning (SonarQube)
- WAR Deployment on Apache Tomcat

---

This project uses a **Declarative Jenkins Pipeline** to automate:

1. **Code Checkout from GitHub**
2. **SonarQube Code Quality Analysis**
3. **Maven Build & Test**
4. **Artifact Upload to Nexus**
5. **Deployment to Apache Tomcat**

---

## 📜 Prerequisites

- Java 11+
- Maven 3.6+
- Git
- Jenkins (with necessary plugins)
- SonarQube Server
- Nexus Repository Manager
- Apache Tomcat (configured on remote or local server)


## 🏗️ Build & Run Locally

```bash
# Clone the repo
git clone https://github.com/<your-org>/number-guess-app.git
cd number-guess-app

# Build the project
mvn clean package

# Run locally using Tomcat
cp target/NumberGuessGame-1.0-SNAPSHOT.war /path/to/tomcat/webapps/
```

## 🏗️ Automate build
- The build runs automatically when there is a commit to main
