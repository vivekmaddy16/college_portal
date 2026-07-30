<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Examination Notices | Babu Banarasi Das University</title>
    <meta name="description" content="Stay updated with the latest examination notices, timetables, and admit card release notifications at Babu Banarasi Das University.">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/png" href="favicon.png">
    <style>
        .notices-wrap {
            max-width: 900px;
            margin: 0 auto;
        }
        .search-notices {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-radius: var(--radius);
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: var(--shadow-sm);
        }
        .search-notices input {
            width: 100%;
            padding: 12px 18px;
            border: 1px solid var(--gray-300);
            border-radius: var(--radius-sm);
            font-size: 15px;
            font-family: var(--font-sans);
            transition: var(--transition);
        }
        .search-notices input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(139,26,43,0.15);
        }
        .notice-card {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-radius: var(--radius);
            padding: 24px;
            margin-bottom: 20px;
            box-shadow: var(--shadow-sm);
            transition: var(--transition);
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
        }
        .notice-card:hover {
            transform: translateX(4px);
            border-color: var(--primary-light);
            box-shadow: var(--shadow);
        }
        .notice-info {
            flex-grow: 1;
        }
        .notice-meta {
            display: flex;
            gap: 12px;
            align-items: center;
            margin-bottom: 12px;
            font-size: 13px;
            color: var(--gray-500);
        }
        .notice-date {
            font-weight: 600;
        }
        .badge-urgency {
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
        }
        .badge-urgency.high {
            background: rgba(229, 62, 98, 0.1);
            color: var(--error);
        }
        .badge-urgency.normal {
            background: rgba(212, 168, 65, 0.15);
            color: #b28320;
        }
        .badge-urgency.info {
            background: rgba(56, 161, 105, 0.1);
            color: var(--success);
        }
        .notice-card h3 {
            font-size: 18px;
            color: var(--dark);
            margin-bottom: 8px;
            font-weight: 700;
        }
        .notice-card p {
            font-size: 14px;
            color: var(--gray-600);
            line-height: 1.6;
        }
        .notice-action {
            flex-shrink: 0;
        }
        .btn-download-pdf {
            background: var(--gray-100);
            color: var(--primary);
            border: 1px solid var(--gray-200);
            padding: 8px 16px;
            border-radius: var(--radius-sm);
            font-size: 13px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: var(--transition);
        }
        .btn-download-pdf:hover {
            background: var(--primary);
            color: var(--white);
            border-color: var(--primary);
        }
        .no-notices {
            text-align: center;
            padding: 40px;
            color: var(--gray-500);
            display: none;
        }
    </style>
</head>
<body>

<jsp:include page="includes/header.jsp" />

<!-- ===== HERO SUB ===== -->
<section class="hero hero-sub">
    <div class="container">
        <div class="hero-content">
            <h1>Examination <span>Notices</span></h1>
            <p>Stay up to date with datesheets, exam regulations, hall tickets distribution schedules, and carry-over dates.</p>
        </div>
    </div>
</section>

<!-- ===== NOTICES SECTION ===== -->
<section class="section">
    <div class="container notices-wrap">

        <div class="search-notices">
            <input type="text" id="noticesSearchInput" placeholder="Filter announcements by title, keyword, or course...">
        </div>

        <div id="noticesContainer">
            <!-- Notice 1 -->
            <div class="notice-card" data-search="admit card registration even semester exam 2027 hall ticket">
                <div class="notice-info">
                    <div class="notice-meta">
                        <span class="notice-date">May 10, 2027</span>
                        <span class="badge-urgency high">Urgent</span>
                    </div>
                    <h3>Distribution of Admit Cards for Even Sem Exams (2026-27)</h3>
                    <p>Admit cards for all regular and carry-over student examinations scheduled in May 2027 will be distributed from the respective department desks starting tomorrow. Clearing college dues is mandatory to collect the card.</p>
                </div>
                <div class="notice-action">
                    <a href="#" class="btn-download-pdf" onclick="alert('Downloading notice attachment...'); return false;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                        PDF Notice
                    </a>
                </div>
            </div>

            <!-- Notice 2 -->
            <div class="notice-card" data-search="datesheet timetable schedule even semester btech mba bca bba mca">
                <div class="notice-info">
                    <div class="notice-meta">
                        <span class="notice-date">May 02, 2027</span>
                        <span class="badge-urgency high">Urgent</span>
                    </div>
                    <h3>Final Examination Timetable (Even Semester 2026-27)</h3>
                    <p>The final Datesheet for the Even Semester Examinations commencing from May 15, 2027 has been released. The schedules include B.Tech, BCA, MCA, BBA, and MBA programs. Students are requested to check shift timings carefully.</p>
                </div>
                <div class="notice-action">
                    <a href="#" class="btn-download-pdf" onclick="alert('Downloading Timetable PDF...'); return false;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                        Datesheet
                    </a>
                </div>
            </div>

            <!-- Notice 3 -->
            <div class="notice-card" data-search="carry over back paper exam odd semester results registration">
                <div class="notice-info">
                    <div class="notice-meta">
                        <span class="notice-date">April 18, 2027</span>
                        <span class="badge-urgency normal">Notice</span>
                    </div>
                    <h3>Registration for Special Carry-Over Examination (Odd Semester Back Papers)</h3>
                    <p>Applications are invited for carry-over examinations for subjects belonging to the Odd Semester. Online registration can be processed via the fee payment portal. Deadline for registration is April 30, 2027.</p>
                </div>
                <div class="notice-action">
                    <a href="fee-payment.jsp" class="btn-download-pdf">
                        Register Now
                    </a>
                </div>
            </div>

            <!-- Notice 4 -->
            <div class="notice-card" data-search="rules guidelines unfair means ufm regulations code of conduct">
                <div class="notice-info">
                    <div class="notice-meta">
                        <span class="notice-date">April 05, 2027</span>
                        <span class="badge-urgency info">Info</span>
                    </div>
                    <h3>Student Code of Conduct & Guidelines during Examination</h3>
                    <p>Students must carry valid college ID card and Admit Card to the exam hall. Strict actions will be taken against students found possessing electronic gadgets (mobiles, smartwatches) or violating general decorum.</p>
                </div>
                <div class="notice-action">
                    <a href="#" class="btn-download-pdf" onclick="alert('Downloading Code of Conduct details...'); return false;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                        Rules List
                    </a>
                </div>
            </div>
        </div>

        <div id="noNotices" class="no-notices">
            <h3>No notices match your search criteria.</h3>
            <p>Please try using other keywords (e.g. Datesheet, Admit Card, Carry-over).</p>
        </div>

    </div>
</section>

<jsp:include page="includes/footer.jsp" />

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('noticesSearchInput');
        const cards = document.querySelectorAll('.notice-card');
        const container = document.getElementById('noticesContainer');
        const noNoticesDiv = document.getElementById('noNotices');

        searchInput.addEventListener('input', function() {
            const query = searchInput.value.toLowerCase().trim();
            let matches = 0;

            cards.forEach(card => {
                const searchTags = card.getAttribute('data-search');
                const content = card.innerText.toLowerCase();

                if (content.includes(query) || (searchTags && searchTags.includes(query))) {
                    card.style.display = '';
                    matches++;
                } else {
                    card.style.display = 'none';
                }
            });

            if (matches === 0) {
                noNoticesDiv.style.display = 'block';
            } else {
                noNoticesDiv.style.display = 'none';
            }
        });
    });
</script>
</body>
</html>
