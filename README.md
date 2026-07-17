# YourCampus University Website (JSP + HTML + CSS + JS)

BBDU jaisi university website ka clone-style project — original layout/structure inspired hai, lekin content/images placeholder hain jinhe aap apni university ke hisaab se replace kar sakte ho.

## 📁 Project Structure
```
university-website/
├── pom.xml                          # Maven config (WAR packaging)
├── src/
│   ├── main/
│   │   ├── java/com/university/servlet/
│   │   │   └── ContactServlet.java  # Handles contact/apply form POST
│   │   └── webapp/
│   │       ├── WEB-INF/web.xml      # Deployment descriptor
│   │       ├── includes/
│   │       │   ├── header.jsp
│   │       │   └── footer.jsp
│   │       ├── css/style.css
│   │       ├── js/script.js
│   │       ├── images/              # put your images here
│   │       ├── index.jsp
│   │       ├── about.jsp
│   │       ├── courses.jsp
│   │       ├── contact.jsp
│   │       ├── apply.jsp
│   │       └── 404.jsp
```

## 🛠 Prerequisites
1. **JDK 11+** installed (`java -version` se check karo)
2. **Apache Tomcat 10.x** (Jakarta EE / `jakarta.servlet` namespace ke liye 10.x hi lena — Tomcat 9 `javax.servlet` use karta hai)
3. **Maven** installed (`mvn -version`)
4. **VS Code Extensions**:
   - Extension Pack for Java (Microsoft)
   - Community Server Connectors (Tomcat support)
   - (Optional) IntelliSense: "vscode-jsp" or just treat `.jsp` as HTML

## ▶️ Run Steps (VS Code me)

### Option A — Community Server Connector (easiest)
1. VS Code me `Community Server Connectors` extension install karo
2. Left sidebar me "Servers" panel khulega → "+" click karke Tomcat 10 add karo (apna Tomcat install path do)
3. Project folder open karo, `pom.xml` par right-click → **Add/Remove Servers** ya seedha project ko server par right-click "Add and Publish" karo
4. Server start karo → browser me `http://localhost:8080/university-website/` khul jayega

### Option B — Manual (Maven build + Tomcat webapps folder)
```bash
cd university-website
mvn clean package
# Ye target/university-website.war banayega
cp target/university-website.war $TOMCAT_HOME/webapps/
$TOMCAT_HOME/bin/startup.sh    # Windows: startup.bat
```
Fir browser me kholo: `http://localhost:8080/university-website/`

## 🖼 Images
`images/` folder khaali hai — placeholder hai. Apni khud ki (ya royalty-free, jaise Unsplash/Pexels se) images daal do in naamon se, ya `<img>` tags ke `src` change kar do:
- `hero-bg.jpg`, `course-cse.jpg`, `course-ai.jpg`, `course-mba.jpg`, `course-bca.jpg`
- `student1.jpg` ... `student4.jpg`
- `campus-culture.jpg`, `campus-sports.jpg`, `campus-hostel.jpg`

Agar image missing hogi to `onerror` fallback se automatically ek placeholder image dikh jayega — site tootegi nahi.

## ✏️ Customize
- **Colors/branding**: `css/style.css` me top par `:root { --primary: ...; --accent: ...; }` change karo
- **University name/logo**: `includes/header.jsp` aur `includes/footer.jsp`
- **Courses/Placements data**: `index.jsp` aur `courses.jsp` ke top par diya Java list/map edit karo
- **Contact form backend**: `ContactServlet.java` me abhi console pe print ho raha hai — production me isse DB (JDBC) ya email (JavaMail) se replace karna

## ⚠️ Note
Ye project **BBDU se inspired original layout** hai — text, images, alumni names, placement figures sab placeholder/generic hain. Real BBDU ka content (text/photos) copy-paste mat karna agar site publicly deploy kar rahe ho — copyright issue ho sakta hai. Apni khud ki university ka actual data daal ke isko customize karo.
