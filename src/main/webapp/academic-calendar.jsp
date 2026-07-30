<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Academic Calendar 2026-27 | Babu Banarasi Das University</title>
    <meta name="description" content="View official key dates, semesters milestones, exam schedules, and holiday lists at Babu Banarasi Das University.">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/png" href="favicon.png">
    <style>
        .calendar-wrap {
            max-width: 960px;
            margin: 0 auto;
        }
        .filter-bar {
            display: flex;
            gap: 12px;
            margin-bottom: 28px;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
        }
        .tab-btn-group {
            display: flex;
            gap: 8px;
        }
        .tab-btn {
            padding: 10px 20px;
            border-radius: var(--radius-full);
            background: var(--gray-100);
            color: var(--dark-700);
            font-weight: 600;
            font-size: 14px;
            transition: var(--transition);
            border: 1px solid var(--gray-200);
        }
        .tab-btn:hover, .tab-btn.active {
            background: var(--primary);
            color: var(--white);
            border-color: var(--primary);
        }
        .print-btn {
            background: var(--accent);
            color: var(--dark);
            padding: 10px 20px;
            border-radius: var(--radius-full);
            font-weight: 600;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: var(--transition);
        }
        .print-btn:hover {
            background: var(--accent-light);
            transform: translateY(-2px);
        }
        .calendar-card {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            margin-bottom: 40px;
        }
        .calendar-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }
        .calendar-table th {
            background: var(--dark);
            color: var(--white);
            padding: 18px 24px;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .calendar-table td {
            padding: 18px 24px;
            border-bottom: 1px solid var(--gray-200);
            font-size: 15px;
            color: var(--dark-800);
        }
        .calendar-table tr:last-child td {
            border-bottom: none;
        }
        .calendar-table tr:hover td {
            background-color: var(--gray-100);
        }
        .badge-type {
            padding: 4px 10px;
            border-radius: var(--radius-full);
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: inline-block;
        }
        .badge-type.academic {
            background: rgba(139, 26, 43, 0.1);
            color: var(--primary);
        }
        .badge-type.exam {
            background: rgba(212, 168, 65, 0.15);
            color: #b28320;
        }
        .badge-type.holiday {
            background: rgba(56, 161, 105, 0.1);
            color: var(--success);
        }
        @media print {
            .main-header, .topbar, .main-footer, .filter-bar, .back-to-top {
                display: none !important;
            }
            body {
                background: white;
                color: black;
            }
            .calendar-card {
                box-shadow: none;
                border: none;
            }
            .calendar-table th {
                background: #f1f1f1 !important;
                color: black !important;
                border-bottom: 2px solid black;
            }
            .calendar-table td {
                border-bottom: 1px solid #ddd;
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
            <h1>Academic <span>Calendar</span></h1>
            <p>Important dates, exam schedules, registration deadlines, and holidays for the Academic Year 2026-27.</p>
        </div>
    </div>
</section>

<!-- ===== CALENDAR SECTION ===== -->
<section class="section">
    <div class="container calendar-wrap">

        <div class="filter-bar">
            <div class="tab-btn-group">
                <button class="tab-btn active" onclick="filterEvents('all')">All Events</button>
                <button class="tab-btn" onclick="filterEvents('odd')">Odd Sem (Jul-Dec)</button>
                <button class="tab-btn" onclick="filterEvents('even')">Even Sem (Jan-Jun)</button>
                <button class="tab-btn" onclick="filterEvents('holiday')">Holidays List</button>
            </div>
            <button class="print-btn" onclick="window.print()">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 6 2 18 2 18 9"/><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"/><rect x="6" y="14" width="12" height="8"/></svg>
                Print Calendar
            </button>
        </div>

        <div class="calendar-card">
            <table class="calendar-table" id="calendarTable">
                <thead>
                    <tr>
                        <th style="width: 180px;">Date</th>
                        <th>Event Description</th>
                        <th style="width: 160px; text-align: center;">Category</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- ODD SEMESTER -->
                    <tr data-type="odd">
                        <td><strong>July 15, 2026</strong></td>
                        <td>Commencement of Odd Semester Classes (All UG/PG programs)</td>
                        <td style="text-align: center;"><span class="badge-type academic">Academic</span></td>
                    </tr>
                    <tr data-type="odd">
                        <td><strong>August 15, 2026</strong></td>
                        <td>Independence Day Celebration (Flag Hoisting at Campus Lawn)</td>
                        <td style="text-align: center;"><span class="badge-type holiday">Holiday</span></td>
                    </tr>
                    <tr data-type="odd">
                        <td><strong>September 10-15, 2026</strong></td>
                        <td>First Mid-Semester Examination Cycle</td>
                        <td style="text-align: center;"><span class="badge-type exam">Examination</span></td>
                    </tr>
                    <tr data-type="odd">
                        <td><strong>October 20-25, 2026</strong></td>
                        <td>Second Mid-Semester Examination Cycle</td>
                        <td style="text-align: center;"><span class="badge-type exam">Examination</span></td>
                    </tr>
                    <tr data-type="odd">
                        <td><strong>November 8, 2026</strong></td>
                        <td>Diwali Festival Break</td>
                        <td style="text-align: center;"><span class="badge-type holiday">Holiday</span></td>
                    </tr>
                    <tr data-type="odd">
                        <td><strong>December 1-15, 2026</strong></td>
                        <td>Odd Semester End Practical & Written Examinations</td>
                        <td style="text-align: center;"><span class="badge-type exam">Examination</span></td>
                    </tr>
                    <tr data-type="odd">
                        <td><strong>Dec 16 - Jan 5, 2027</strong></td>
                        <td>Winter Vacation for Students</td>
                        <td style="text-align: center;"><span class="badge-type holiday">Holiday</span></td>
                    </tr>
                    
                    <!-- EVEN SEMESTER -->
                    <tr data-type="even">
                        <td><strong>January 8, 2027</strong></td>
                        <td>Commencement of Even Semester Classes</td>
                        <td style="text-align: center;"><span class="badge-type academic">Academic</span></td>
                    </tr>
                    <tr data-type="even">
                        <td><strong>January 26, 2027</strong></td>
                        <td>Republic Day Celebration</td>
                        <td style="text-align: center;"><span class="badge-type holiday">Holiday</span></td>
                    </tr>
                    <tr data-type="even">
                        <td><strong>March 5-10, 2027</strong></td>
                        <td>Even Semester First Mid-Term Examination Cycle</td>
                        <td style="text-align: center;"><span class="badge-type exam">Examination</span></td>
                    </tr>
                    <tr data-type="even">
                        <td><strong>March 24, 2027</strong></td>
                        <td>Holi Festival Holiday</td>
                        <td style="text-align: center;"><span class="badge-type holiday">Holiday</span></td>
                    </tr>
                    <tr data-type="even">
                        <td><strong>April 25-30, 2027</strong></td>
                        <td>Even Semester Second Mid-Term Examination Cycle</td>
                        <td style="text-align: center;"><span class="badge-type exam">Examination</span></td>
                    </tr>
                    <tr data-type="even">
                        <td><strong>May 15-30, 2027</strong></td>
                        <td>Even Semester End Practical & Written Examinations</td>
                        <td style="text-align: center;"><span class="badge-type exam">Examination</span></td>
                    </tr>
                    <tr data-type="even">
                        <td><strong>June 1-30, 2027</strong></td>
                        <td>Summer Internship & Vacation Duration</td>
                        <td style="text-align: center;"><span class="badge-type holiday">Holiday</span></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</section>

<jsp:include page="includes/footer.jsp" />

<script>
    function filterEvents(type) {
        const rows = document.querySelectorAll('#calendarTable tbody tr');
        rows.forEach(row => {
            const rowType = row.getAttribute('data-type');
            if (type === 'all') {
                row.style.display = '';
            } else if (type === 'holiday' && rowType === 'holiday') {
                row.style.display = '';
            } else if (type === 'odd' && rowType === 'odd') {
                row.style.display = '';
            } else if (type === 'even' && rowType === 'even') {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });

        // Toggle active button style
        const buttons = document.querySelectorAll('.tab-btn');
        buttons.forEach(btn => btn.classList.remove('active'));
        
        // Find clicked button and add active
        event.currentTarget.classList.add('active');
    }
</script>
</body>
</html>
