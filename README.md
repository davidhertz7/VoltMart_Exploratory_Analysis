# VoltMart E-Commerce Analysis
<img width="1415" height="450" alt="image" src="https://github.com/user-attachments/assets/b6de3ea7-fb8b-4211-b697-697e6383ba43" />

# Company Background
Established in 2018, **VoltMart is an e-commerce company that sells popular electronics products** and has since expanded to a global customer base. 
The Company sells mainly products through their website or via its mobile app. To gain recognition and reach new customers they use a variety of marketing efforts including Email campaigns, SEO, affiliate links, and Social media.
Their top-selling brands consist of Apple, Samsung, and Lenovo.

The company has extensive volume of data stored on its sales, marketing activities, operational/logistic efficiency, product offerings. 
and loyalty program — the latter potentially being underutilized. This project analyzes and synthesizes this data in order to uncover key insights that can enhance Voltmart’s commercial performance. In collaboration with the Head of Operations, I will provide actionable insights and recommendations to cross-functional teams across Sales, Finance, and Product.

Insights and recommendations are provided on the following key areas:

- **Sales Trends Analysis:** Evaluation of historical sales trends and notable seasonal patterns.
- **Product Line Performance:** An assessment of VoltMarts Product Lines and what impact various products had on sales and returns.
- **Geographical Comparisons:** Analyze and identify strategic market opportunities globally at both regional and country levels.
- **Loyalty Program Success:** Evaluation of the Loyalty Program contributions on customer retention and sales - Should we keep using it?
- **KPI Reporting Refund Rates:** Reporting of overall refund rates and volumes - how does this differ across products?


Key Metrics:
  
- **Sales**
- **AOV** 
- **Order Count** 


The SQL queries used to inspect and clean the data for this analysis can be found here [link].

Targed SQL queries regarding various business questions can be found here [link].

An interactive Tableau dashboard used to report and explore sales trends can be found here [link].



# Data Structure & Initial Checks

The companies main database structure as seen below consists of four tables: orders, customers, order_status, geo_lookup, with a total row count of 108,130 records. 


 
<p align="center">
<img width="685" height="400" alt="image" src="https://github.com/user-attachments/assets/6652ec9b-cede-46d4-ae7b-6210d7d5e73d" />
</p>

[Entity Relationship Diagram here]



# Executive Summary
<p align="center">
<img width="1779" height="788" alt="image" src="https://github.com/user-attachments/assets/4073fc0f-db36-4195-8479-8ca09ee8c8a6" />
</p>








### Overview of Findings

Between 2019 and 2022, VoltMart generated $28M in sales from 108K orders, with an average order value (AOV) of $260 - ranging in monthly sales from $178k to $1.2M. The company experienced its strongest year-over-year growth in 2020, with revenue up 163%, order volume up 101%, and AOV increasing by 31%. 

However, the following years showed a downward trend with significant drops in 2022: sales declined by 46%, order volume by 40%, and AOV by 10%. While part of this decline can be attributed to the normalization of consumer behavior after the pandemic, the following sections explore additional contributing factors and identify key opportunities for improvement.






# Insights Deep Dive
### Sales Trends
<p align="center">
<img width="1687" height="601" alt="image" src="https://github.com/user-attachments/assets/6c884e05-17a6-48a5-8ba4-222f6c19063a" />
</p>







* **Sales more than doubled in 2020, and reached their peak in December 2020 with 4,019 orders totaling $1,251,721 monthly revenue.** Sales have plateaued ever since, with notable dips in February 2021 and February 2022, nearing pre-COVID levels.

* The downward trend continued through October 2022, when VoltMart recorded an all-time low across all key performance indicators — monthly revenue of $178K, just 825 orders, and an average order value of $216. This marked a **22-month decline before a slight recovery and a return to normal seasonal holiday patterns**.
  
* **AOV saw a significant spike in march 2020 up 27% compared to march 2019.** Customer surveys during this period revealed increased purchases of higher-cost products, driven by lifestyle changes and the transition to remote work.
  March 2020 also recorded the largest month-over-month growth in both revenue and num. of Orders, **up 55% and 46% respectively**.
  
* Besides 2022 having the worst trend across the whole period it still remained above the pre-COVID 2019 baseline in all three key performance indicators, much do to a stronger 1Q22 and 2Q22 that stood out in terms of the same period in 2019






  

  

### Seasonality
<p align="center">
<img width="1332" height="345" alt="image" src="https://github.com/user-attachments/assets/29945ee4-1398-4c6f-b75a-ed62b9efc228" />
</p>

* Across the period 2019 to 2022 the overall worst-performing months are Jan, Feb and October especially in the north star metrics revenue and num. of orders that **went down with more then -25%.** 
  
* VoltMart sees an **holiday surge each year in November (18%) And December (23%)**. Furthermore, March makes a strong **bounceback in sales 18% MoM**, after a steap downward trend occur in February.  
  
* Sep customers tend to buy more expensive products. **4% growth AOV highest by all months**. Were Nov is the worst month -4%. Look further into if there are any special offers or marketing strategy around this period that can be useful to boost sales in worse performing periods of the year. 


  
* There have always been a consistent dip in revenue MoM from Sept to Oct but not as significant as in the year of 2022 (-55%). Main drivers behind this dip are the products 27in gaming monitor, and high cost apple products.


### Product Performance
<img width="1880" height="644" alt="image" src="https://github.com/user-attachments/assets/5c0438f0-c704-43c3-89ad-1f7f363ed938" />






* **Three products — Gaming Monitor, MacBook Air, and Apple AirPods — account for 85% of total company revenue ($23M) and represent 75K orders, or 70% of all company orders**.
MacBook Air has the highest average order value (AOV) at $1,588, meaning even a modest increase in order volume could drive a significant uplift in total revenue.
  
  
* From December 2019 to its peak in December 2020, **MacBook revenue grew significantly with a 405% YoY increase**; however, the following years the curve went down with the steapest decline in Feb 2021 - this drop was mostly contained to the **NA region(-$70K) and the direct traffic marketing channel(-$120K)** - may indicate a shift in trends and competitors there


* In the headphones category, the Bose SoundSport Headphones have underperformed, contributing to less than 1% of total revenues and orders despite being, on average, $40 cheaper than the well-performing AirPods.

  
* VoltMart are heavintly dependant on the apple brands products, **the brand is responsible for 51% of the total revenue across the whole period**. It's then surprising to see Apple iPhone being the product that performs amongst the worst in the key metrics num. of orders(288) and revenue($213K), it only makes up for less than 1 percent of the company's shares in both metrics. Apple iPhone shows untapped potential with the third highest AOV of $741 it can make a real impact on revenue only from boosting up sales a bit.
   



### Geographical Comparisons
<img width="1881" height="644" alt="image" src="https://github.com/user-attachments/assets/c17abd1f-59fa-4373-ae85-15fe5a2b2d6c" />




* NA and EMEA stand for 80% of the company's total revenue from 2019 to 2022. Top country US make up for about 45% of total revenue. Primary contributor to NA's dominance in both Sales Revenue and order count.
q  A    Q  aa  aq    §  
  
* All regions exhibit similar dips in 2021 and 2022, indicating a global/macro trend. NA is responsible for the big dip in Feb 2021 - 300K of the total dip 550K


* In japan($393) and Netherlands($289) people purchase on average the most expensive products. Lowest AOV in Austrailia($204) and Spain($223).

  
* **44 countries make each less than $1000 in revenue From 2019 to 2020**, total revenue for all these countries are just 16K, AOV  $155, and only 108 in total orders. Look into maybe reallocating marketing efforts from these countries to more profitable countries and regions.




### Loyalty Program
<img width="950" height="693" alt="image" src="https://github.com/user-attachments/assets/ee35f268-9bd5-4f38-99fd-a8388a3fbd01" />


* Total Revenue across the years 2019 to 2022 for non-loyalty members were $17M in total with an average yearly sales revenue of $4.2M and AOV of $275 for loyalty members $11M in total with an average yearly sales revenue of $2.7M and AOV of $240. 

* Non-Loyals outperformed Loyalty Members the first year when it was introduced , **2019 the share of annual revenue was 90% to 10%**. But most recent years there's have been a mayor shift in share, **Loyalty members passes Non-Loyals 55% to 45%**. 
  
  
* Loyalty members shown more resiliance after the peak covid years. All KPIs still considerly higher compared to pre-pendemic. 5x higher revenue and number of. Orders. AOV up $40. Non-Loyal down in both AOV($20) and number of. orders (4K).




### Refund Rates
<img width="1495" height="420" alt="image" src="https://github.com/user-attachments/assets/7c409e74-880f-4ef2-b58e-bc1aaeee16de" />

* Overall refund tremds: Out of 108K total orders 5379(5,9%) was refunded, totaling $2,2M in refunded sales. 2021 recorded the highest share out of the total refund amounts 60% of refunds happens this year.



* Thinkpad(11.7%), Macbook(11.4%), and Apple Iphone(7.6%) had the highest refund rates. Macbook Air($746K), 27in 4K gaming monitor($642K), Apple Airpod($429K), and ThinkPad Laptop($382K) recorded the highest total refunded amounts.


* Apple products have the highest share of total refunds out of all brands 58% with the highest refund amounts out of all brands $1,1M

  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.




# Recommendations:

Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following: 

* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Reallocate Marketing Spend from Low-Performing Markets: The 44 countries generating less than $1,000 in revenue collectively contribute minimal business impact. Redirecting budget toward higher-performing countries is likely to generate a stronger return on investment.
  
* Bundle the Apple Ecosystem: Position iPhones alongside MacBooks, AirPods, and accessories to encourage multi-product purchases. Customers invested in the Apple ecosystem are often more likely to purchase additional Apple devices when presented with integrated value propositions.
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  


# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Assumption 1 (ex: missing country records were for customers based in the US, and were re-coded to be US citizens)
  
* Assumption 1 (ex: data for December 2021 was missing - this was imputed using a combination of historical trends and December 2020 data)
  
* Assumption 1 (ex: because 3% of the refund date column contained non-sensical dates, these were excluded from the analysis)



# Dashboard
To gain more insights for your team use the interactive Tableau dashboard below [here](https://public.tableau.com/app/profile/david.hertz/viz/VoltMart-IntSalesDashboard/SalesDashboard)
<p align="center">
<img width="1000" height="800" alt="Sales Dashboard" src="https://github.com/user-attachments/assets/d3e1040c-ca4b-4470-bfe7-8c81bcbbac67" />
</p>






