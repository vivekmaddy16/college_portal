<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Result Portal | Babu Banarasi Das University</title>
    <meta name="description" content="Access online semester examination results, grade cards, and academic reports at Babu Banarasi Das University.">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/png" href="favicon.png">
    <style>
        .result-wrap {
            max-width: 720px;
            margin: 0 auto;
        }
        .result-query-card {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-radius: var(--radius);
            padding: 30px;
            box-shadow: var(--shadow);
            margin-bottom: 40px;
        }
        .report-card {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-radius: var(--radius-lg);
            padding: 32px;
            box-shadow: var(--shadow-lg);
            display: none; /* dynamically shown */
            animation: fadeInUp 0.5s ease-out forwards;
            margin-bottom: 60px;
        }
        .report-header {
            border-bottom: 2px solid var(--primary);
            padding-bottom: 16px;
            margin-bottom: 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .report-header h3 {
            color: var(--primary);
            font-size: 20px;
            font-weight: 700;
        }
        .student-details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 16px 24px;
            margin-bottom: 28px;
            font-size: 14px;
        }
        .student-details-grid div strong {
            color: var(--dark-700);
        }
        .grades-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            font-size: 14px;
            margin-bottom: 28px;
        }
        .grades-table th {
            background: var(--gray-100);
            color: var(--dark);
            padding: 12px 16px;
            font-weight: 600;
            border-bottom: 2px solid var(--gray-300);
        }
        .grades-table td {
            padding: 14px 16px;
            border-bottom: 1px solid var(--gray-200);
            color: var(--dark-800);
        }
        .grades-table tr:last-child td {
            border-bottom: none;
        }
        .badge-grade {
            padding: 2px 8px;
            border-radius: 4px;
            font-weight: 700;
            font-size: 12px;
            display: inline-block;
        }
        .badge-grade.pass {
            background: rgba(56, 161, 105, 0.1);
            color: var(--success);
        }
        .badge-grade.fail {
            background: rgba(229, 62, 98, 0.1);
            color: var(--error);
        }
        .stats-summary {
            background: var(--gray-100);
            border-radius: var(--radius);
            padding: 18px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 16px;
            font-weight: 600;
        }
        .stats-summary span strong {
            color: var(--primary);
            font-size: 18px;
        }
        .report-actions {
            display: flex;
            justify-content: flex-end;
            margin-top: 24px;
            gap: 12px;
        }
        .loading-container {
            display: none;
            text-align: center;
            padding: 40px;
        }
        .spinner {
            width: 48px;
            height: 48px;
            border: 4px solid rgba(139, 26, 43, 0.1);
            border-left-color: var(--primary);
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto 16px;
        }
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
        @media print {
            .main-header, .topbar, .main-footer, .result-query-card, .report-actions, .back-to-top {
                display: none !important;
            }
            .report-card {
                box-shadow: none;
                border: none;
                padding: 0;
                display: block !important;
            }
        }
    </style>
</head>
<body>

<jsp:include page="includes/header.jsp" />

<!-- ===== HERO SUB ===== -->
<section class="hero hero-sub">
    <div class="container">
        <div class="hero-content">
            <h1>Result <span>Portal</span></h1>
            <p>Access your marksheet records and semester-end cumulative grades online securely.</p>
        </div>
    </div>
</section>

<!-- ===== RESULT PORTAL INTERFACE ===== -->
<section class="section">
    <div class="container result-wrap">

        <!-- Input Query Box -->
        <div class="result-query-card">
            <div class="section-heading" style="text-align:left; margin-bottom:24px;">
                <span class="tag">Academic Record</span>
                <h2 style="font-size:24px;">Grade Card Inquiry</h2>
            </div>
            
            <form id="resultForm" onsubmit="fetchGrades(event)">
                <div class="form-group">
                    <label for="rollNo">Student Roll Number / Enrollment ID *</label>
                    <input type="text" id="rollNo" placeholder="e.g. 2026101" required>
                    <p style="font-size:12px; color:var(--gray-500); margin-top:4px;">Tip: Enter any mock numeric ID (e.g. 2026101) to run a simulation.</p>
                </div>
                <div class="form-group">
                    <label for="semester">Semester *</label>
                    <select id="semester" required>
                        <option value="">— Select semester —</option>
                        <option value="1">I Semester</option>
                        <option value="2">II Semester</option>
                        <option value="3">III Semester</option>
                        <option value="4">IV Semester</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary" style="width:100%;">Fetch Marksheet →</button>
            </form>
        </div>

        <!-- Processing State -->
        <div class="loading-container" id="resultLoading">
            <div class="spinner"></div>
            <h3>Connecting to Examination Database...</h3>
            <p style="color:var(--gray-500); font-size:13px; margin-top:4px;">Retrieving grade sheets...</p>
        </div>

        <!-- Report Card Container (Initially Hidden) -->
        <div class="report-card" id="studentReport">
            <div class="report-header">
                <h3>Babu Banarasi Das University</h3>
                <span style="font-weight:700; color:var(--accent); font-size:14px; text-transform:uppercase; letter-spacing:1px;">Grade Statement</span>
            </div>

            <div class="student-details-grid">
                <div><strong>Student Name:</strong> Abhishek Sharma</div>
                <div><strong>Roll Number:</strong> <span id="dispRoll">2026101</span></div>
                <div><strong>Father Name:</strong> R. K. Sharma</div>
                <div><strong>Semester:</strong> <span id="dispSem">III Semester</span></div>
                <div><strong>Course:</strong> B.Tech - Computer Science & Engineering</div>
                <div><strong>Exam Session:</strong> Winter Session 2026-27</div>
            </div>

            <table class="grades-table">
                <thead>
                    <tr>
                        <th>Subject Code</th>
                        <th>Subject Name</th>
                        <th style="text-align: center;">Credits</th>
                        <th style="text-align: center;">Grade Point</th>
                        <th style="text-align: center;">Letter Grade</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>TCS-301</td>
                        <td>Advanced Java Programming</td>
                        <td style="text-align: center;">4</td>
                        <td style="text-align: center;">9</td>
                        <td style="text-align: center;"><span class="badge-grade pass">A+</span></td>
                    </tr>
                    <tr>
                        <td>TCS-302</td>
                        <td>Relational Database Systems (SQL)</td>
                        <td style="text-align: center;">4</td>
                        <td style="text-align: center;">10</td>
                        <td style="text-align: center;"><span class="badge-grade pass">O</span></td>
                    </tr>
                    <tr>
                        <td>TCS-303</td>
                        <td>Software Engineering Methodologies</td>
                        <td style="text-align: center;">3</td>
                        <td style="text-align: center;">8</td>
                        <td style="text-align: center;"><span class="badge-grade pass">A</span></td>
                    </tr>
                    <tr>
                        <td>TMA-301</td>
                        <td>Mathematical Foundations of Computer Science</td>
                        <td style="text-align: center;">4</td>
                        <td style="text-align: center;">7</td>
                        <td style="text-align: center;"><span class="badge-grade pass">B+</span></td>
                    </tr>
                    <tr>
                        <td>PCS-351</td>
                        <td>Java Lab &amp; DBMS Lab Practical</td>
                        <td style="text-align: center;">2</td>
                        <td style="text-align: center;">9</td>
                        <td style="text-align: center;"><span class="badge-grade pass">A+</span></td>
                    </tr>
                </tbody>
            </table>

            <div class="stats-summary">
                <span>SGPA: <strong id="dispSgpa">8.65</strong></span>
                <span>CGPA: <strong id="dispCgpa">8.54</strong></span>
                <span style="color:var(--success);">Result Status: PASS</span>
            </div>

            <div class="report-actions">
                <button class="btn btn-secondary" onclick="window.print()" style="padding: 8px 16px; font-size:13px;">Print Grade Card</button>
                <button class="btn btn-primary" onclick="alert('Downloading digital PDF marksheet...');" style="padding: 8px 16px; font-size:13px;">Download PDF</button>
            </div>
        </div>

    </div>
</section>

<jsp:include page="includes/footer.jsp" />

<script>
    function fetchGrades(event) {
        event.preventDefault();
        
        const rollVal = document.getElementById('rollNo').value;
        const semSelect = document.getElementById('semester');
        const semText = semSelect.options[semSelect.selectedIndex].text;

        // Hide old card
        document.getElementById('studentReport').style.display = 'none';

        // Show loading spinner
        const loader = document.getElementById('resultLoading');
        loader.style.display = 'block';

        // Simulate network/db query latency
        setTimeout(() => {
            loader.style.display = 'none';
            
            // Set dynamic text values
            document.getElementById('dispRoll').textContent = rollVal;
            document.getElementById('dispSem').textContent = semText;

            // Generate slight variations in SGPA/CGPA based on roll number to simulate actual calculation
            let numericSeed = parseInt(rollVal.replace(/\D/g, '')) || 2026101;
            let finalSgpa = ((numericSeed % 25) / 10 + 7.5).toFixed(2);
            let finalCgpa = (parseFloat(finalSgpa) - 0.15).toFixed(2);

            document.getElementById('dispSgpa').textContent = finalSgpa;
            document.getElementById('dispCgpa').textContent = finalCgpa;

            // Show report card
            const card = document.getElementById('studentReport');
            card.style.display = 'block';
        }, 1500);
    }
</script>
</body>
</html>
