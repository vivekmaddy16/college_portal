<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.university.dao.InquiryDAO" %>
<%@ page import="com.university.model.Inquiry" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Babu Banarasi Das University</title>
    <meta name="description" content="Inquiries & Admissions admin dashboard for Babu Banarasi Das University.">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/png" href="favicon.png">
    <style>
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
            margin-bottom: 40px;
        }
        .stat-card {
            background: var(--gray-100);
            border-left: 5px solid var(--primary);
            border-radius: var(--radius);
            padding: 24px;
            box-shadow: var(--shadow);
            transition: var(--transition);
        }
        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
        }
        .stat-card.accent {
            border-left-color: var(--accent);
        }
        .stat-card.success {
            border-left-color: var(--success);
        }
        .stat-card h3 {
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--gray-500);
            margin-bottom: 8px;
        }
        .stat-card .value {
            font-size: 36px;
            font-weight: 800;
            color: var(--dark);
            line-height: 1;
        }
        .stat-card .desc {
            font-size: 13px;
            color: var(--gray-600);
            margin-top: 8px;
        }
        .control-panel {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-radius: var(--radius);
            padding: 20px;
            margin-bottom: 24px;
            box-shadow: var(--shadow-sm);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 16px;
        }
        .search-wrapper {
            position: relative;
            flex-grow: 1;
            max-width: 480px;
        }
        .search-wrapper input {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid var(--gray-300);
            border-radius: var(--radius-sm);
            font-family: var(--font-sans);
            font-size: 14px;
            transition: var(--transition);
        }
        .search-wrapper input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(139,26,43,0.15);
        }
        .table-container {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-radius: var(--radius);
            box-shadow: var(--shadow-sm);
            overflow-x: auto;
            margin-bottom: 60px;
        }
        .admin-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            font-size: 14px;
        }
        .admin-table th {
            background: var(--dark);
            color: var(--white);
            padding: 16px 20px;
            font-weight: 600;
        }
        .admin-table td {
            padding: 16px 20px;
            border-bottom: 1px solid var(--gray-200);
            color: var(--dark-800);
            vertical-align: top;
        }
        .admin-table tr:last-child td {
            border-bottom: none;
        }
        .admin-table tr:hover td {
            background-color: var(--gray-100);
        }
        .badge-program {
            background: rgba(139, 26, 43, 0.1);
            color: var(--primary);
            padding: 4px 8px;
            border-radius: var(--radius-sm);
            font-size: 12px;
            font-weight: 600;
            display: inline-block;
        }
        .btn-delete {
            background: rgba(229, 62, 98, 0.1);
            color: var(--error);
            padding: 6px 12px;
            border-radius: var(--radius-sm);
            font-size: 12px;
            font-weight: 600;
            transition: var(--transition);
            display: inline-block;
        }
        .btn-delete:hover {
            background: var(--error);
            color: var(--white);
        }
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: var(--gray-500);
        }
        .empty-state svg {
            width: 64px;
            height: 64px;
            stroke: var(--gray-400);
            margin-bottom: 16px;
        }
    </style>
</head>
<body>

<jsp:include page="includes/header.jsp" />

<!-- ===== HERO SUB ===== -->
<section class="hero hero-sub">
    <div class="container">
        <div class="hero-content">
            <h1>Admin <span>Dashboard</span></h1>
            <p>Access submitted course applications and general queries from the SQL database.</p>
        </div>
    </div>
</section>

<!-- ===== MAIN SECTION ===== -->
<section class="section">
    <div class="container-wide">

        <%
            String status = request.getParameter("status");
            if ("deleted".equals(status)) {
        %>
            <div class="alert-success" style="margin-bottom: 24px;">✅ The inquiry record was successfully deleted from the database.</div>
        <% } else if ("error".equals(status)) { %>
            <div class="alert-error" style="margin-bottom: 24px;">❌ An error occurred while executing the database operation.</div>
        <% } %>

        <%
            InquiryDAO dao = new InquiryDAO();
            List<Inquiry> inquiries = null;
            Map<String, Integer> programCounts = null;
            int totalCount = 0;
            int engCount = 0;
            int mgmtCount = 0;

            try {
                inquiries = dao.getAll();
                programCounts = dao.getProgramCounts();
                totalCount = inquiries.size();

                // Compute simplified stats for cards
                for (Inquiry inq : inquiries) {
                    String prog = inq.getProgram();
                    if (prog != null) {
                        String lowerProg = prog.toLowerCase();
                        if (lowerProg.contains("tech") || lowerProg.contains("bca") || lowerProg.contains("mca")) {
                            engCount++;
                        } else if (lowerProg.contains("ba") || lowerProg.contains("com") || lowerProg.contains("management") || lowerProg.contains("law")) {
                            mgmtCount++;
                        }
                    }
                }
            } catch (Exception e) {
                out.println("<div class='alert-error'>Database Connection Error: " + e.getMessage() + "</div>");
                e.printStackTrace();
            }
        %>

        <!-- Stat Cards Grid -->
        <div class="dashboard-grid">
            <div class="stat-card">
                <h3>Total Submissions</h3>
                <div class="value"><%= totalCount %></div>
                <p class="desc">Active inquiries stored in H2 database</p>
            </div>
            <div class="stat-card accent">
                <h3>Engineering & Tech</h3>
                <div class="value"><%= engCount %></div>
                <p class="desc">B.Tech, BCA, MCA applicants</p>
            </div>
            <div class="stat-card success">
                <h3>Business & Humanities</h3>
                <div class="value"><%= mgmtCount %></div>
                <p class="desc">BBA, MBA, B.Com, LLB & other courses</p>
            </div>
        </div>

        <div class="section-heading" style="text-align: left; margin-bottom: 20px;">
            <span class="tag">Inquiry Pipeline</span>
            <h2>Submitted Applications</h2>
        </div>

        <!-- Search Control Panel -->
        <div class="control-panel">
            <div class="search-wrapper">
                <input type="text" id="dbSearchInput" placeholder="Search by name, email, phone, program, or message...">
            </div>
            <div style="display: flex; align-items: center; gap: 20px; flex-wrap: wrap;">
                <div style="font-size: 13px; color: var(--gray-600);">
                    Showing <strong id="visibleCount"><%= totalCount %></strong> of <strong><%= totalCount %></strong> records
                </div>
                <a href="admin-action?action=logout" class="btn btn-primary" style="padding: 8px 16px; font-size: 13px; margin: 0;">Logout ⤶</a>
            </div>
        </div>

        <!-- Table Container -->
        <div class="table-container">
            <% if (inquiries == null || inquiries.isEmpty()) { %>
                <div class="empty-state">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                        <rect x="3" y="4" width="18" height="16" rx="2" ry="2" />
                        <line x1="16" y1="2" x2="16" y2="6" />
                        <line x1="8" y1="2" x2="8" y2="6" />
                        <line x1="3" y1="10" x2="21" y2="10" />
                    </svg>
                    <h3>No Records Found</h3>
                    <p>Submissions from the admissions forms will appear here once submitted.</p>
                </div>
            <% } else { %>
                <table class="admin-table" id="inquiriesTable">
                    <thead>
                        <tr>
                            <th style="width: 50px;">ID</th>
                            <th style="width: 140px;">Date &amp; Time</th>
                            <th style="width: 160px;">Name</th>
                            <th style="width: 200px;">Contact Details</th>
                            <th style="width: 180px;">Program</th>
                            <th>Additional Notes</th>
                            <th style="width: 90px; text-align: center;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Inquiry inquiry : inquiries) {
                                String dateStr = inquiry.getCreatedAt().toString();
                                if (dateStr.length() > 19) {
                                    dateStr = dateStr.substring(0, 19); // YYYY-MM-DD HH:mm:ss
                                }
                        %>
                            <tr>
                                <td style="font-weight: 600; color: var(--gray-500);"><%= inquiry.getId() %></td>
                                <td style="font-size: 12px; color: var(--gray-600);"><%= dateStr %></td>
                                <td style="font-weight: 600; color: var(--primary);"><%= inquiry.getName() %></td>
                                <td>
                                    <div style="font-weight: 500;"><%= inquiry.getEmail() %></div>
                                    <div style="font-size: 12px; color: var(--gray-600); margin-top: 2px;"><%= inquiry.getPhone() %></div>
                                </td>
                                <td>
                                    <% if (inquiry.getProgram() != null && !inquiry.getProgram().trim().isEmpty()) { %>
                                        <span class="badge-program"><%= inquiry.getProgram() %></span>
                                    <% } else { %>
                                        <span style="color: var(--gray-400); font-style: italic;">General Inquiry</span>
                                    <% } %>
                                </td>
                                <td style="font-size: 13px; max-width: 300px; word-wrap: break-word;"><%= inquiry.getMessage() != null ? inquiry.getMessage() : "" %></td>
                                <td style="text-align: center; vertical-align: middle;">
                                    <a href="admin-action?action=delete&id=<%= inquiry.getId() %>" 
                                       class="btn-delete"
                                       onclick="return confirm('Are you sure you want to delete inquiry #<%= inquiry.getId() %> submitted by <%= inquiry.getName() %>?');">
                                        Delete
                                    </a>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } %>
        </div>

    </div>
</section>

<jsp:include page="includes/footer.jsp" />

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('dbSearchInput');
        const table = document.getElementById('inquiriesTable');
        const visibleCountSpan = document.getElementById('visibleCount');

        if (searchInput && table) {
            const rows = table.querySelectorAll('tbody tr');
            
            searchInput.addEventListener('input', function() {
                const query = searchInput.value.toLowerCase().trim();
                let visibleCount = 0;

                rows.forEach(row => {
                    const text = row.textContent.toLowerCase();
                    if (text.includes(query)) {
                        row.style.display = '';
                        visibleCount++;
                    } else {
                        row.style.display = 'none';
                    }
                });

                visibleCountSpan.textContent = visibleCount;
            });
        }
    });
</script>
</body>
</html>
