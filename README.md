# Babu Banarasi Das University (BBDU) Web Portal

A premium, highly interactive university web portal built using the JSP + Servlet + HTML + CSS + JS stack. The design is inspired by the Babu Banarasi Das University (BBDU) layout, offering a visual aesthetic with smooth animations, custom AI-generated campus images, and mobile-first responsiveness.

---

## 🏛️ Core Features

- **Premium UI/UX**: Designed using Inter and Playfair Display fonts, custom maroon & gold color palette, glassmorphism card layouts, and sleek hover transformations.
- **Micro-Animations**: Features custom CSS keyframe animations, scroll-triggered fade-ins, and animated statistics counters.
- **Interactive Bento Grid**: Highlighting Campus Life (Art & Culture, Sports, Hostels, and Clubs) with a custom JavaScript tab-switching panel.
- **Dynamic Program List & Filter**: An interactive filterable course menu showcasing all active UG/PG programs.
- **Contact & Inquiry Pipeline**: A form validation mechanism connected to a background `ContactServlet` to capture admissions inquiries.
- **BBDU Branding**: Seamless branding across all include components, footers, headers, and metadata descriptions.

---

## 📁 Project Structure

```
university-website/
├── pom.xml                                    # Maven Config (Tomcat/JSTL dependencies)
├── src/main/java/com/university/servlet/
│   └── ContactServlet.java                    # Handles admissions query form POST
├── src/main/webapp/
│   ├── WEB-INF/web.xml                        # Deployment descriptor
│   ├── css/style.css                          # Premium Responsive CSS Design System
│   ├── js/script.js                           # Interactive JavaScript & Validation
│   ├── includes/
│   │   ├── header.jsp                         # Header Include with scrolling marquee
│   │   └── footer.jsp                         # Rich Footer with SVG social icons
│   ├── images/
│   │   ├── hero-bg.png                        # Generated grand campus view
│   │   ├── campus-culture.png                 # Generated cultural fest art
│   │   ├── campus-sports.png                  # Generated sports stadium
│   │   ├── campus-hostel.png                  # Generated modern hostels
│   │   └── campus-library.png                 # Generated library interior
│   ├── index.jsp                              # Home Page (Stats, Placements, Bento Grid)
│   ├── about.jsp                              # About Page (Accreditations, Values)
│   ├── courses.jsp                            # Courses Page (Interactive Program Filter)
│   ├── contact.jsp                            # Contact Page (Form & Embed Google Map)
│   ├── apply.jsp                              # Admissions Registration Form
│   └── 404.jsp                                # Animated 404 Error Page
```

---

## 🛠️ Prerequisites

1. **Java Development Kit (JDK) 11 or 17** (e.g. Eclipse Adoptium)
2. **Apache Tomcat 10.x** (Required for `jakarta.servlet` namespace)
3. **Apache Maven 3.6+**

---

## ▶️ Setup & Run

### 1. Build the Package
From the project root folder, package the application into a deployable Web Archive (`.war`) file:
```bash
mvn clean package
```
This builds the package and generates `target/university-website.war`.

### 2. Deploy to Apache Tomcat
Copy the generated WAR file into your Tomcat installation's `webapps` directory:
```bash
# Windows
copy target\university-website.war C:\path\to\apache-tomcat\webapps\
```

### 3. Start Tomcat
Start your local Tomcat server:
```bash
# Windows
C:\path\to\apache-tomcat\bin\startup.bat
```

### 4. Visit the Portal
Open your web browser and navigate to:
🔗 **[http://localhost:8080/university-website/](http://localhost:8080/university-website/)**

---

## ✏️ Customization & Extensibility

- **Branding Colors**: Easily customize the look and feel in `css/style.css` by changing the CSS variables in the `:root` block (e.g. `--primary`, `--accent`, `--dark`).
- **Database Connection**: In `ContactServlet.java`, replace the console log blocks (`System.out.println`) with actual JDBC statements or Hibernate calls to persist inquiries directly to a relational database (e.g., MySQL, PostgreSQL).
