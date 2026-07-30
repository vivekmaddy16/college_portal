<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fee Payment Portal | Babu Banarasi Das University</title>
    <meta name="description" content="Pay academic tuition fees, examination fees, and hostel fees securely online using Babu Banarasi Das University online payment system.">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/png" href="favicon.png">
    <style>
        .fee-wrap {
            max-width: 680px;
            margin: 0 auto;
        }
        .fee-card {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-radius: var(--radius);
            padding: 32px;
            box-shadow: var(--shadow);
            margin-bottom: 40px;
        }
        .receipt-card {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-radius: var(--radius-lg);
            padding: 32px;
            box-shadow: var(--shadow-lg);
            display: none; /* dynamically shown */
            animation: fadeInUp 0.5s ease-out forwards;
            margin-bottom: 60px;
        }
        .receipt-header {
            border-bottom: 2px dashed var(--gray-300);
            padding-bottom: 16px;
            margin-bottom: 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .receipt-header h3 {
            color: var(--primary);
            font-size: 20px;
            font-weight: 700;
        }
        .receipt-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 28px;
            font-size: 14px;
        }
        .receipt-grid div strong {
            color: var(--dark-700);
        }
        .receipt-footer {
            background: var(--gray-100);
            border-radius: var(--radius);
            padding: 20px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: 600;
        }
        .receipt-footer .amount {
            color: var(--success);
            font-size: 22px;
            font-weight: 800;
        }
        .payment-modal {
            display: none;
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(15, 27, 45, 0.7);
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }
        .modal-content {
            background: var(--white);
            border-radius: var(--radius);
            padding: 40px;
            max-width: 400px;
            width: 90%;
            text-align: center;
            box-shadow: var(--shadow-xl);
            animation: fadeInUp 0.3s ease-out;
        }
        .payment-progress-bar {
            width: 100%;
            height: 6px;
            background: var(--gray-200);
            border-radius: 3px;
            overflow: hidden;
            margin: 24px 0;
        }
        .progress-fill {
            width: 0%;
            height: 100%;
            background: var(--primary);
            animation: fillProgress 2.5s ease-in-out forwards;
        }
        @keyframes fillProgress {
            0% { width: 0%; }
            30% { width: 45%; }
            70% { width: 85%; }
            100% { width: 100%; }
        }
        @media print {
            .main-header, .topbar, .main-footer, .fee-card, .receipt-actions, .back-to-top {
                display: none !important;
            }
            .receipt-card {
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
            <h1>Fee <span>Payment</span></h1>
            <p>Secure online gateway to submit academic fees, examination registration fees, and hostel dues.</p>
        </div>
    </div>
</section>

<!-- ===== FEE PAYMENT SECTION ===== -->
<section class="section">
    <div class="container fee-wrap">

        <!-- Form Panel -->
        <div class="fee-card" id="paymentFormPanel">
            <div class="section-heading" style="text-align:left; margin-bottom:24px;">
                <span class="tag">Secure Gateway</span>
                <h2 style="font-size:24px;">Online Fee Submission</h2>
            </div>
            
            <form id="feeForm" onsubmit="processPayment(event)">
                <div class="form-group">
                    <label for="enrollmentNo">Student Enrollment / Roll Number *</label>
                    <input type="text" id="enrollmentNo" placeholder="Enter Enrollment ID" required>
                </div>
                <div class="form-group">
                    <label for="studentName">Student Full Name *</label>
                    <input type="text" id="studentName" placeholder="Enter full name" required>
                </div>
                <div class="form-group">
                    <label for="feeType">Select Fee Category *</label>
                    <select id="feeType" onchange="autoPopulateAmount()" required>
                        <option value="">— Choose fee type —</option>
                        <option value="tuition">Odd Semester Tuition Fee</option>
                        <option value="hostel">Hostel Accommodation Dues</option>
                        <option value="exam">Semester Examination Fee</option>
                        <option value="carryover">Carry-Over Exam Backpaper Fee</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="amount">Payable Amount (INR) *</label>
                    <input type="number" id="amount" placeholder="0.00" required min="100">
                </div>
                <div class="form-group">
                    <label for="payMethod">Payment Channel *</label>
                    <select id="payMethod" required>
                        <option value="">— Select payment option —</option>
                        <option value="upi">UPI (GPay / PhonePe / Paytm)</option>
                        <option value="card">Debit Card / Credit Card</option>
                        <option value="netbanking">Net Banking</option>
                    </select>
                </div>
                
                <button type="submit" class="btn btn-primary" style="width:100%; margin-top:12px;">Proceed to Pay →</button>
            </form>
        </div>

        <!-- Secure Modal Screen -->
        <div class="payment-modal" id="paymentModal">
            <div class="modal-content">
                <div class="spinner"></div>
                <h3 style="color:var(--dark); margin-top:16px;">Securing Payment Channel...</h3>
                <p style="color:var(--gray-500); font-size:13px; margin-top:8px;">Please do not close the tab or refresh the page.</p>
                <div class="payment-progress-bar">
                    <div class="progress-fill"></div>
                </div>
                <span style="font-size:12px; font-weight:700; color:var(--gray-600);">PCI-DSS Secured Gateway</span>
            </div>
        </div>

        <!-- Receipt Panel (Initially Hidden) -->
        <div class="receipt-card" id="paymentReceipt">
            <div class="receipt-header">
                <h3>BBD University Fee Receipt</h3>
                <span style="background:#e6f4ea; color:#137333; padding: 4px 12px; border-radius:4px; font-weight:700; font-size:12px; text-transform:uppercase;">Success</span>
            </div>

            <div class="receipt-grid">
                <div><strong>Transaction ID:</strong> <span id="recTxn">TXN987654321</span></div>
                <div><strong>Receipt Date:</strong> <span id="recDate">30-Jul-2026</span></div>
                <div><strong>Enrollment ID:</strong> <span id="recEnroll">2026101</span></div>
                <div><strong>Student Name:</strong> <span id="recName">Abhishek Sharma</span></div>
                <div><strong>Fee Category:</strong> <span id="recCategory">Semester Examination Fee</span></div>
                <div><strong>Paid via:</strong> <span id="recChannel">UPI (GPay / PhonePe)</span></div>
            </div>

            <div class="receipt-footer">
                <span>Total Dues Paid</span>
                <span class="amount">₹<span id="recAmount">3,500</span></span>
            </div>

            <p style="font-size:12px; color:var(--gray-500); margin-top:20px; text-align:center; font-style:italic;">
                This is a digitally generated transaction receipt and requires no physical signature.
            </p>

            <div class="receipt-actions" style="display:flex; justify-content:flex-end; gap:12px; margin-top:24px;">
                <button class="btn btn-secondary" onclick="window.print()" style="padding: 8px 16px; font-size:13px;">Print Receipt</button>
                <button class="btn btn-primary" onclick="resetPaymentForm()" style="padding: 8px 16px; font-size:13px;">New Payment</button>
            </div>
        </div>

    </div>
</section>

<jsp:include page="includes/footer.jsp" />

<script>
    function autoPopulateAmount() {
        const feeType = document.getElementById('feeType').value;
        const amountField = document.getElementById('amount');

        if (feeType === 'tuition') {
            amountField.value = '65000';
        } else if (feeType === 'hostel') {
            amountField.value = '38000';
        } else if (feeType === 'exam') {
            amountField.value = '3500';
        } else if (feeType === 'carryover') {
            amountField.value = '1500';
        } else {
            amountField.value = '';
        }
    }

    function processPayment(event) {
        event.preventDefault();

        // Show secure gateway modal
        const modal = document.getElementById('paymentModal');
        modal.style.display = 'flex';

        // Retrieve form values
        const enrollNo = document.getElementById('enrollmentNo').value;
        const nameVal = document.getElementById('studentName').value;
        const categorySelect = document.getElementById('feeType');
        const categoryText = categorySelect.options[categorySelect.selectedIndex].text;
        const amountVal = parseFloat(document.getElementById('amount').value).toLocaleString('en-IN');
        const channelSelect = document.getElementById('payMethod');
        const channelText = channelSelect.options[channelSelect.selectedIndex].text;

        // Generate Transaction ID & Date
        const txnId = 'TXN' + Math.floor(100000000 + Math.random() * 900000000);
        const currentDate = new Date().toLocaleDateString('en-GB', {
            day: '2-digit',
            month: 'short',
            year: 'numeric'
        }).replace(/ /g, '-');

        // Simulate Gateway validation & verification
        setTimeout(() => {
            modal.style.display = 'none';
            document.getElementById('paymentFormPanel').style.display = 'none';

            // Populate receipt data
            document.getElementById('recTxn').textContent = txnId;
            document.getElementById('recDate').textContent = currentDate;
            document.getElementById('recEnroll').textContent = enrollNo;
            document.getElementById('recName').textContent = nameVal;
            document.getElementById('recCategory').textContent = categoryText;
            document.getElementById('recChannel').textContent = channelText;
            document.getElementById('recAmount').textContent = amountVal;

            // Show receipt
            document.getElementById('paymentReceipt').style.display = 'block';
        }, 2500);
    }

    function resetPaymentForm() {
        document.getElementById('feeForm').reset();
        document.getElementById('paymentReceipt').style.display = 'none';
        document.getElementById('paymentFormPanel').style.display = 'block';
    }
</script>
</body>
</html>
