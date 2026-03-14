# 🛒 Retail Sales Performance & Customer Behavior Analysis
### Power BI | Python | SQL | Excel | DAX

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![DAX](https://img.shields.io/badge/DAX-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)

---

## 📌 Project Overview

This project is an end-to-end business intelligence solution — from raw data cleaning in Python all the way through to a fully interactive Power BI dashboard. It analyzes retail sales performance and customer behavior across 100,000 orders, transforming messy transactional data into clear, actionable business insights.

The pipeline covers every stage: data cleaning and validation in Python, data modeling and aggregation in SQL, and final visualization in Power BI using custom DAX measures and interactive slicers.

The dashboard is split into two fully interactive pages, each with a dedicated slicer panel that allows users to filter the entire report dynamically:

- **Page 1 — Sales Performance** — Revenue, orders, profit, category contribution, top products & brands, monthly trends, order channels — filterable by Day Type, Delivery Days, Payment Type, and Customer Segment
- **Page 2 — Customer Behavior** — Customer metrics, delivery performance, cancellation & return rates, payment methods, orders by time and day type, cancellation reasons — filterable by Brand, Product Name, Category, and Customer Segment

---

## 🧩 Business Problem

Retail businesses generate enormous amounts of transactional data every day — but without a proper analytics pipeline, that data is unreliable and unused. Common challenges include:

- **Dirty data** — duplicate orders, missing values, inconsistent category names, and incorrect date formats making analysis impossible before it starts
- **No visibility into which product categories or brands drive the most profit**
- **High cancellation and return rates eating into revenue without clear root causes**
- **Delivery performance issues that go untracked until they become customer complaints**
- **No way to slice performance by customer segment, payment type, or day type**
- **Inability to identify peak ordering times for smarter inventory and staffing planning**

This project was built to address all of these gaps — starting with a clean, validated dataset and ending with a fully interactive dashboard that business teams can explore and act on.

---

## 📂 Dataset Description

The dataset simulates a real retail business with the following data points:

| Data Area | Fields Included |
|---|---|
| **Orders** | Order ID, Order Date, Order Time, Day Type (Normal / Festival) |
| **Revenue & Profit** | Revenue, Profit, Profit Margin %, Average Order Value |
| **Products & Categories** | Product Name, Category, Brand |
| **Customers** | Customer ID, City, Customer Segment, Total Customers |
| **Delivery** | Delivery Days, Delivery Day Bands (2–7 days) |
| **Payments** | Payment Type (Credit Card, Debit Card, UPI, Net Banking, COD) |
| **Cancellations & Returns** | Cancellation Reason, Return Rate %, Cancellation Rate % |
| **Ratings** | Average Customer Rating |

> The dataset covers **100,000 orders** across multiple product categories, cities, customer segments, and order channels.

---

## 🛠️ Tools & Technologies Used

| Tool / Technology | Purpose |
|---|---|
| **Python (Pandas, NumPy)** | Data cleaning, missing value treatment, data type validation, duplicate removal, outlier detection |
| **Power BI Desktop** | Dashboard design, data modeling, interactive visuals, slicer panels |
| **DAX (Data Analysis Expressions)** | Custom KPI measures — profit margin, average order value, cancellation rate, return rate |
| **SQL** | Data extraction, filtering, and aggregations before loading into Power BI |
| **Microsoft Excel** | Initial data exploration, quick sanity checks, data formatting |

---

## 📊 Dashboard Overview

### Page 1 — Sales Performance


---

#### 🎛️ Interactive Slicer Panel (Left Sidebar)

One of the key features of this page is the **dedicated slicer panel** on the left, which allows users to dynamically filter the entire dashboard canvas in real time. All visuals — KPI cards, charts, and trends — respond simultaneously to any slicer selection.

| Slicer | Values | Purpose |
|---|---|---|
| **Day Type** | All / Normal Day / Diwali / Dussehra / Sankranthi / New Year | Filter all metrics by order day type |
| **Delivery Days** | All / 2 / 3 / 4 / 5 / 6 / 7 | Isolate performance for specific delivery windows |
| **Payment Type** | All / Credit Card / Debit Card / UPI / Net Banking / COD | Analyze revenue and orders by payment method |
| **Customer Segment** | All / Segment values | Compare KPIs across different customer groups |

> 💡 **Example use case:** Select *Diwali Festival* in the Day Type slicer + *COD* in Payment Type → instantly see how Cash on Delivery orders behave specifically during Diwali, and whether cancellation or return rates spike.

---

#### 📊 KPI Cards (Top Row)

| KPI | Value | What It Tells You |
|---|---|---|
| **Total Orders** | 100K | Overall transaction volume |
| **Total Revenue** | ₹4,482M | Gross revenue across all categories |
| **AVG Order Value** | ₹50.34K | Average spend per order |
| **Profit** | ₹1,761M | Net profit after costs |
| **Profit Margin %** | 35.0% | Operational efficiency indicator |

---

#### 📈 Charts & Visuals

- 📌 **Revenue Contribution by Category (Donut Chart)**
  All five categories contribute almost equally — Home Appliances (20.24%), Accessories (20.08%), Furniture (19.99%), Electronics (19.93%), and Fashion (19.76%) — indicating a well-balanced product portfolio with no dangerous single-category dependency.

- 📌 **Top Products by Revenue (Bar Chart)**
  Vacuum Cleaner (455M), Laptop Backpack (453M), Air Fryer (452M), Running Shoes (452M), and Office Supplies (447M). Use the **Customer Segment** slicer to see which segment drives each product's sales.

- 📌 **Top 5 Brands by Revenue (Bar Chart)**
  HP leads at 321M, followed by Apple, Asus, Lenovo, and Philips — all tightly grouped between 314M–316M.

- 📌 **Month Wise Revenue (Line Chart)**
  Revenue fluctuates between 353M (February low) and 389M (July peak). Filtering by **Day Type** reveals how much of any month's revenue comes from festival vs. normal days.

- 📌 **Order Channel (Pie Chart)**
  Nearly equal split — Store (33.48%), Website (33.27%), Mobile App (33.25%). Filter by **Payment Type** to see whether COD is concentrated in physical stores or also high online.

---

### Page 2 — Customer Behavior


---

#### 🎛️ Interactive Slicer Panel (Left Sidebar)

Page 2 has its own dedicated slicer panel focused on customer and product-level filtering, enabling granular behavioral analysis.

| Slicer | Values | Purpose |
|---|---|---|
| **Brand** | All / HP / Apple / Asus / Lenovo / Philips / others | Isolate behavior metrics for a specific brand's customers |
| **Product Name** | All / individual products | Deep-dive into cancellations or returns for a single product |
| **Category** | All / Fashion / Electronics / Furniture / Home Appliances / Accessories | Compare behavioral KPIs across product categories |
| **Customer Segment** | All / Segment values | Understand how different customer groups behave post-purchase |

> 💡 **Example use case:** Select *Electronics* in Category + *Apple* in Brand → see the cancellation rate, return rate, delivery days, and payment preference specifically for Apple Electronics customers.

---

#### 📊 KPI Cards (Top Row)

| KPI | Value | What It Tells You |
|---|---|---|
| **Total Customers** | 18.91K | Unique customer count |
| **AVG Delivery Days** | 4.5 days | Current fulfilment speed |
| **Cancellation Rate %** | 4.9% | Share of orders cancelled before delivery |
| **Return Rate %** | 5.0% | Share of orders returned post-delivery |
| **AVG Rating** | 3.7 / 5.0 | Overall customer satisfaction score |

---

#### 📈 Charts & Visuals

- 📌 **Payment Types (Donut Chart)**
  All five payment methods are nearly equal — Cash on Delivery (20.12%), Credit Card (20.11%), UPI (19.97%), Net Banking (19.94%), Debit Card (19.86%). Filter by **Category** to see if certain product types skew toward COD.

- 📌 **No. of Orders by Day Type (Horizontal Bar Chart)**
  Normal days dominate at 70,016 orders, with festival spikes on Diwali (9,973), Dussehra (6,975), Sankranthi (6,963), and New Year (6,073). Filter by **Brand** to see which brands peak most on festivals.

- 📌 **Orders Count by Delivery Days (Bar Chart)**
  Delivery times spread from 2 to 7 days fairly evenly — no clear concentration at the faster end, suggesting inconsistent logistics performance across regions or vendor partners.

- 📌 **Orders by Time (Time Series / Candlestick Chart)**
  Strong evening peak (18:00–21:00) and a secondary morning peak (09:00–12:00). Very low overnight activity. Filter by **Customer Segment** to see if certain segments order at different times.

- 📌 **Order Cancellation Reasons (Donut Chart)**
  Five reasons share nearly equal weight — Changed Mind (20.87%), Delivery Taking Too Long (19.89%), Found Cheaper Elsewhere (19.82%), Payment Issues (19.76%), Ordered by Mistake (19.66%). Filter by **Category** or **Product Name** to find if specific items have disproportionate cancellation reasons.

---

## 💡 Key Insights

1. **Revenue is well-diversified** — no single category, brand, or channel exceeds ~21%, which significantly reduces business concentration risk.

2. **Profit margin of 35% is strong**, but the average customer rating of 3.7/5 reveals a clear gap between financial health and actual customer satisfaction.

3. **February is consistently the weakest revenue month** (353M vs. 389M in July) — filtering the Month Wise chart by Day Type confirms this dip is driven by below-average normal-day orders, not a lack of festivals.

4. **Evening hours (18:00–21:00) drive peak order volume**, yet average delivery sits at 4.5 days — customers ordering in prime time aren't getting fast fulfillment, which likely contributes to the rating gap.

5. **Festival days are high-opportunity windows** — Diwali alone drives ~10K orders. Filtering by Brand during Diwali shows whether specific brands are capturing this demand or losing it to cancellations.

6. **Cancellations are spread evenly across five reasons** — no single root cause dominates, meaning the business needs a broad operational response rather than one targeted fix.

7. **All three order channels perform equally** — using the Payment Type slicer reveals that COD is slightly more concentrated in Store orders, suggesting online customers prefer digital payment methods.

8. **"Delivery taking too long" is a top cancellation reason** — filtering the Cancellation Reasons chart by Delivery Days = 6 or 7 shows a direct, measurable spike in delivery-related cancellations for slower shipments.

---

## 📋 Business Recommendations

### 1. 🚚 Improve Last-Mile Delivery Speed
> **Problem:** Average delivery is 4.5 days and "delivery taking too long" is one of the top five cancellation reasons. The Orders Count by Delivery Days chart shows orders still reaching customers at day 6 and 7.
>
> **Suggested Solution:** Partner with regional courier services for same/next-day delivery in top cities. Use the Delivery Days slicer to identify which cities or categories are seeing the most 6–7 day deliveries and prioritize those routes.
>
> **Estimated Business Impact:** Reducing average delivery to 3 days could cut delivery-related cancellations by 25–30% and improve the customer rating from 3.7 toward 4.2+.

---

### 2. 🎯 Launch Targeted February Promotions
> **Problem:** February consistently records the lowest monthly revenue (353M vs. 389M in July). The Day Type slicer confirms this is a normal-day demand problem, not a festival gap.
>
> **Suggested Solution:** Design a "February Flash Sale" — bundle top-category products, offer limited-time discounts on Home Appliances and Electronics, and push Mobile App notifications during the 18:00–21:00 peak window.
>
> **Estimated Business Impact:** A 10% revenue lift in February alone could add ~35M in annual revenue.

---

### 3. 📱 Optimize Mobile App During Peak Hours
> **Problem:** Mobile App drives 33.25% of orders but isn't leading other channels despite the global shift toward mobile commerce. The Orders by Time chart shows the 18:00–21:00 window is the highest-traffic period.
>
> **Suggested Solution:** Push personalized notifications to Mobile App users between 17:30–18:30 (just before peak). Introduce app-exclusive flash deals and a streamlined one-tap checkout to convert the evening traffic surge.
>
> **Estimated Business Impact:** A 5% improvement in mobile conversion during peak hours could add 2–3K orders per month.

---

### 4. 🎪 Build a Festival Demand Playbook
> **Problem:** Festival days drive significant order spikes (Diwali: 9,973 orders) but the Brand and Category slicers reveal that cancellation rates spike for certain categories during festivals, suggesting inventory and delivery capacity aren't scaling with demand.
>
> **Suggested Solution:** Pre-stock top 10 products by category 3–4 weeks before major festivals. Set up dedicated festival fulfilment teams. Communicate realistic delivery timelines upfront in the order confirmation.
>
> **Estimated Business Impact:** Capturing 15% more of festival demand could generate 10–15M in additional revenue per festival period.

---

### 5. ⭐ Customer Experience Recovery Program
> **Problem:** Average rating of 3.7/5 signals meaningful dissatisfaction. Filtering the rating KPI by Customer Segment reveals which segments are most at risk of churn.
>
> **Suggested Solution:** Implement a post-delivery feedback workflow. Trigger automated discount vouchers for customers who experienced delays or cancellations. Track NPS by segment monthly and monitor it directly on the dashboard.
>
> **Estimated Business Impact:** Improving the average rating to 4.2+ is correlated with 15–20% higher repeat purchase rates in retail.

---

### 6. 💳 Reduce Cash-on-Delivery Dependency
> **Problem:** COD at 20.12% carries higher return and cancellation risk. Filtering the Payment Type slicer alongside Cancellation Rate confirms COD orders have a disproportionate share of returns.
>
> **Suggested Solution:** Offer a 1–2% discount for prepaid orders via UPI or Credit Card. Display a "Pay Now & Get Priority Delivery" incentive prominently at checkout.
>
> **Estimated Business Impact:** Shifting 30% of COD to prepaid could reduce return rate from 5.0% to ~3.5%, saving significant reverse logistics costs.

---

## 📈 Expected Business Impact

| Metric | Current | Expected After Improvements |
|---|---|---|
| **Monthly Revenue** | ~374M avg | **+10–18% → ~415–440M** |
| **Profit Margin** | 35.0% | **+2–3% → 37–38%** |
| **Cancellation Rate** | 4.9% | **−30% → ~3.4%** |
| **Return Rate** | 5.0% | **−20% → ~4.0%** |
| **Average Customer Rating** | 3.7 / 5.0 | **+14% → ~4.2** |
| **Average Delivery Days** | 4.5 days | **−33% → ~3.0 days** |
| **Mobile App Order Share** | 33.25% | **+5–7% → ~35–36%** |
| **February Revenue (Low Month)** | 353M | **+10% → ~388M** |

---

## 🏁 Conclusion

This project demonstrates a complete, production-style data analytics workflow — from raw messy data to a polished, fully interactive dashboard. Python handled the foundational work of cleaning and validating the data, ensuring every number the user sees is trustworthy. SQL structured the data for analysis, and Power BI with DAX and an 8-slicer interactive panel brought it to life.

The slicer panels are what elevate this dashboard beyond a static report. Users can instantly filter by Customer Segment, Category, Brand, Payment Type, Day Type, Delivery Days, and Product — cross-referencing any combination in real time to answer specific business questions without opening a single spreadsheet.

The Sales Performance page tells you *what* is happening. The Customer Behavior page tells you *why* and *when*. Together with the interactive filters, they give a 360° view that supports faster, smarter decisions across pricing, logistics, marketing, and customer experience.

---

## 👤 Author

**Bommideni Venkateshwar**

Aspiring Data Analyst skilled in Python, SQL, Power BI, and Excel. Passionate about building end-to-end analytics pipelines — from data cleaning to interactive dashboards — that turn raw data into decisions that matter.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=flat&logo=linkedin)](https://linkedin.com)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?style=flat&logo=github)](https://github.com)
[![Email](https://img.shields.io/badge/Email-Contact-red?style=flat&logo=gmail)](mailto:your.email@gmail.com)

> 💬 *"Good analysis starts with clean data. Everything else follows."*

---

## 📁 Repository Structure

```
📦 Retail-Sales-Power-BI
 ┣ 📊 RetailSales_Dashboard.pbix          ← Power BI dashboard file
 ┣ 📂 Python
 ┃ ┣ 📄 data_cleaning.py                  ← Full cleaning & validation script
 ┃ ┗ 📄 data_validation_report.txt        ← Validation check output log
 ┣ 📂 Dataset
 ┃ ┣ 📄 retail_sales_raw.csv              ← Original raw data
 ┃ ┗ 📄 retail_sales_clean.csv            ← Cleaned data (Python output)
 ┣ 📂 SQL
 ┃ ┗ 📄 retail_queries.sql                ← SQL aggregation queries
 ┣ 📂 Screenshots
 ┃ ┣ 🖼️ page1_sales_performance.png
 ┃ ┗ 🖼️ page2_customer_behavior.png
 ┣ 📄 DAX_Measures.md                     ← All custom DAX formulas documented
 ┗ 📄 README.md
```

---

*⭐ If you found this project useful, consider giving it a star on GitHub!*
